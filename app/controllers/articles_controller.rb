class ArticlesController < ApplicationController
  def api
  	render json: get_articles
  end

	def get_articles 
		uri = URI("https://en.wikipedia.org/w/api.php")
		uri.query = URI.encode_www_form(query_params)

		response = Net::HTTP.get_response(uri)
		
		JSON.parse(response.body)
	end

	def query_params
		{
			action: 'query',
			list: 'recentchanges',
			rctype: 'edit',
			rcprop: 'ids|title|user|timestamp|comment',
			rclimit: 100,
			redirect: true,
			format: 'json'
		}
	end
end
