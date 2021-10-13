Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'museums', to: 'museums#index'

  get 'compositions', to: 'compositions#index'

  get 'gyms', to: 'gyms#index'
  get 'classes', to: 'classes#index'

end
