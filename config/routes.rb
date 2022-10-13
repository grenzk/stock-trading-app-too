Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  namespace :admin do
    get '/', to: 'users#index'
    resources :users
  end

  resources :stocks
  get '/portfolio', to: 'stocks#index'
  get '/transactions', to: 'stocks#transactions', as: 'transactions'

  resources :marketplace
  get 'marketplace/?symbol=:symbol', to: 'marketplace#index', as: 'company_info'

  
end
