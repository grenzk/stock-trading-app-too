Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  namespace :admin do
    get '/', to: 'users#index'
  end

  resources :stocks
  get '/portfolio', to: 'stocks#index'

  resources :marketplace
  get 'marketplace/?symbol=:symbol', to: 'marketplace#index', as: 'company_info'
end
