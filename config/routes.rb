Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  get '/museums/:id/edit', to: 'museums#edit'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:id/compositions', to: 'museum_compositions#index'
  get '/museums/:id/compositions/new', to: 'museum_compositions#new'
  post '/museums/:id/compositions', to: 'museum_compositions#create'
  post '/museums', to: 'museums#create'
  patch '/museums/:id', to: 'museums#update'
  delete '/museums/:id', to: 'museums#destroy'

  get '/gyms', to: 'gyms#index'
  get '/gyms/new', to: 'gyms#new'
  get '/gyms/:id/edit', to: 'gyms#edit'
  get '/gyms/:id', to: 'gyms#show'

  get '/gyms/:id/activities', to: 'gym_activities#index'
  get '/gyms/:id/activities/new', to: 'gym_activities#new'
  post '/gyms/:id/activities', to: 'gym_activities#create'

  post '/gyms', to: 'gyms#create'
  patch '/gyms/:id', to: 'gyms#update'
  delete '/gyms/:id', to: 'gyms#destroy'


  get '/activities', to: 'activities#index'
  get '/activities/:id', to: 'activities#show'
  get '/activities/:id/edit', to: 'activities#edit'
  patch '/activities/:id', to: 'activities#update'
  delete '/activities/:id', to: 'activities#destroy'

  get '/compositions', to: 'compositions#index'
  get '/compositions/:id', to: 'compositions#show'
  get '/compositions/:id/edit', to: 'compositions#edit'
  patch '/compositions/:id', to: 'compositions#update'
  delete '/compositions/:id', to: 'compositions#destroy'
end
