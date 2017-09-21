Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'login'  => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  # mount_griddler
  match 'webhook', to: 'webhook_event_requests#webhook', via: [:get, :post]

  resources :webhook_event_requests do
    post 'webhook', on: :collection
  end

  resources :sessions
  resources :users
  resources :posts
end
