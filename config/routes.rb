Rails.application.routes.draw do
  devise_for :users

  get '/users/:id', to: 'users#show', as: 'user'
  get 'admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'

  resources :users do
    resources :goals
    resources :salary_histories
  end

  root 'pages#home'
end
