Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'users/passwords' }
  ActiveAdmin.routes(self)

  get '/users/:id', to: 'users#show', as: 'user'
  # get 'admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'

  resources :users do
    resources :goals
    resources :salary_histories
  end

  root 'pages#home'
end
