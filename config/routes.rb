Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  namespace :admin do
    get '/', to: 'users#index'
    resources :users
    resources :pending_traders
    resources :user_transactions, only: [:index]
  end

  resources :stocks
  resources :quotes, except: [:show]
  get 'quotes/:symbol', to: 'quotes#show'
  get 'sell_stocks/:symbol', to: 'sell_stocks#show', as: 'get_sellstock'
  post 'sell_stocks/:symbol', to: 'sell_stocks#create', as: 'sell_stock'
  get '/portfolio', to: 'stocks#index'
  get '/transactions', to: 'stocks#transactions', as: 'transactions'
  get '/markets', to: 'stocks#markets', as: 'markets'
  get 'markets/?symbol=:symbol', to: 'stocks#markets', as: 'company_info'
  resources :user_transactions, only: [:index]
end
