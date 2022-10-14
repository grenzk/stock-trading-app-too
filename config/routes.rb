Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  namespace :admin do
    get '/', to: 'users#index'
    resources :users
    resources :pending_traders
  end

  resources :stocks
  get '/portfolio', to: 'stocks#portfolio'
  get '/transactions', to: 'stocks#transactions', as: 'transactions'
  get '/markets', to: 'stocks#markets', as: 'markets'
  get 'markets/?symbol=:symbol', to: 'stocks#markets', as: 'company_info'
end
