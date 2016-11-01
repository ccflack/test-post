Rails.application.routes.draw do

  root 'posts#index'

  resources :categories
  resources :users
  resources :posts do
    member do
      post 'upvote'
      delete 'downvote'
    end
  end
  resources :votes
  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => redirect('/sessions/new')
  get '/signup' => redirect('/users/new')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
