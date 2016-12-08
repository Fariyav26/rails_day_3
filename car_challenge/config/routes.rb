Rails.application.routes.draw do

  get '/cars/index' => 'cars#index'
  get '/cars/create' => 'cars#create'
end
