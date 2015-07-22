Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  get '/home', to: 'home#index'

  namespace :api do
    namespace :v1 do
      root 'test#index', :defaults => { :format => 'json' }
      get '/t', to: 'test#index'
    end
  end

end
