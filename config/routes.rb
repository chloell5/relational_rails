Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/museums', to: 'museums#index'
  get '/museums/:id', to: 'museums#show'
  get '/museums/:id/compositions', to: 'museum_compositions#index'

  get 'gyms', to: 'gyms#index'
  get 'gyms/:id', to: 'gyms#show'
  get 'activities', to: 'activities#index'

  get '/compositions', to: 'compositions#index'
  get '/compositions/:id', to: 'compositions#show'
end
