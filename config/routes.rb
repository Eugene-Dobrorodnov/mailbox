Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  get '/home', to: 'home#index'

  namespace :api do
    namespace :v1, constraints: { format: :json }, defaults: { format: :json } do
      root 'home#index'
      devise_for :users, path: 'auth'
      resources :latters, only: %w(create index update)
    end
  end

end
