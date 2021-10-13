Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/museums', to: 'museums#index'
  get '/museums/:id', to: 'museums#show'

  get '/compositions', to: 'compositions#index'
  get '/compositions/:id', to: 'compositions#show'
end
