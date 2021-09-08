Rails.application.routes.draw do
  get 'sessions/new'
  get 'posts/index'
  resources :posts do
    collection do
      post :confirm 
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
