Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'users/passwords' }

  get '/users/:id', to: 'users#show', as: 'user'
  get 'admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'

  resources :users do
    resources :goals
  end

  root 'pages#home'
end
