Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'sessions#new'
  root 'welcome#index'

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login'  => 'sessions#new', :as => 'login'

  # mount_griddler
  match 'webhoook', to: 'posts#webhoook', via: [:get, :post]

  resources :sessions
  resources :users
  resources :posts
end
