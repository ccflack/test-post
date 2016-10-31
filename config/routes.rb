Rails.application.routes.draw do
  resources :categories
  resources :users
  root 'posts#index'
  resources :posts do
    member do
      get 'upvote'
      get 'downvote'
      get 'visit'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
