Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  get '/museums/:id/edit', to: 'museums#edit'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:id/compositions', to: 'museum_compositions#index'
  post '/museums', to: 'museums#create'
  patch '/museums/:id', to: 'museums#update'

  get '/gyms', to: 'gyms#index'
  get '/gyms/:id', to: 'gyms#show'
  get '/activities', to: 'activities#index'
  get '/activities', to: 'activities#show'
  get '/activities/:id', to: 'activities#show'
  get '/gyms/:id/activities', to: 'activities#index'
  

  get '/compositions', to: 'compositions#index'
  get '/compositions/:id', to: 'compositions#show'
end
