Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # root 'sessions#new'
  # get 'logout' => 'sessions#destroy', :as => 'logout'
  # get 'login' => 'sessions#new', as => 'login'

  # match 'webhoook' => 'posts#webhoook', :as => 'webhoook'

  mount_griddler

  # get 'exit', to: 'sessions#destroy', as: :logout
  # get ':username', to: 'users#show', as: :user

  match 'webhoook', to: 'posts#webhoook', via: [:get, :post]

  resources :users
  resources :sessions
  resources :posts
end
