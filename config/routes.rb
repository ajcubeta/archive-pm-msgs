Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'sessions#new'
  root 'welcome#index'

  # get 'logout' => 'sessions#destroy', :as => 'logout'
  # get 'login'  => 'sessions#new', :as => 'login'

  resources :webhook_event_requests do
    post 'webhook', on: :collection
  end

  # mount_griddler
  match 'webhook', to: 'webhook_event_requests#webhook', via: [:get, :post]

  # root 'webhook_event_requests#index'
  # post 'webhook' => 'webhook_event_requests#webhook'

  resources :sessions
  resources :users
  resources :posts
end
