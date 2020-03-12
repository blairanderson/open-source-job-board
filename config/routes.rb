Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    resources :posts
  end

  resources :posts do
    member do
      post :publish
      post :unpublish
      get :vote
      get :preview
      post :apply_to
    end
  end

  delete 'logout' => 'logout#logout'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  root 'posts#index'
end
