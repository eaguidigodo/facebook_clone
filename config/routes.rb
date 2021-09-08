Rails.application.routes.draw do
  get 'sessions/new'
  get 'posts/index'
  post 'posts/confirm'
  resources :posts
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
