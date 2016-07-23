class ArticlesController < ApplicationController
  def index
	  @results = get_recent_changes
  end

	def get_recent_changes 
		uri = URI("https://en.wikipedia.org/w/api.php")
		uri.query = URI.encode_www_form(query_params)

		response = Net::HTTP.get_response(uri)
		result = JSON.parse(response.body)

		result['query']['recentchanges']
	end

	def query_params
		{
			action: 'query',
			list: 'recentchanges',
			rctype: 'edit',
			rcprop: 'ids|title|user|timestamp|comment',
			rclimit: 50,
			redirect: true,
			format: 'json'
		}
	end
end
