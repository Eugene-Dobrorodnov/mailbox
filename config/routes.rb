Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  get '/home', to: 'home#index'

  namespace :api do
    namespace :v1, constraints: { format: :json }, defaults: { format: :json } do
      root 'home#index'
      devise_for :users, path: 'auth'
      get 'latters/sent',  to: 'latters#sent'
      get 'latters/spam',  to: 'latters#spam'
      resources :latters, only: %w(index show create update)
    end
  end

end
