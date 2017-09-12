Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # root 'sessions#new'
  # get 'logout' => 'sessions#destroy', :as => 'logout'
  # get 'login' => 'sessions#new', as => 'login'

  # match 'webhoook' => 'posts#webhoook', :as => 'webhoook'

  resources :users
  resources :sessions
  resources :posts
end
