Rails.application.routes.draw do
  get '/' => 'articles#index'
  get '/api' => 'articles#api'
end
