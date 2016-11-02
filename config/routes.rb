Rails.application.routes.draw do

  root 'posts#index'
  resources :posts do
    resources :comments
  end
  resources :categories
  resources :users
  resources :tags
  resources :sessions, only: [:new, :create, :destroy]
  resources :votes do
    member do
      post 'up'
      delete 'down'
    end
  end

  get '/login' => redirect('/sessions/new')
  get '/signup' => redirect('/users/new')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
