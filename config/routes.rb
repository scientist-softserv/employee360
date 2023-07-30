Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'users/passwords' }

  get '/users/:id', to: 'users#show', as: 'user'

  resources :users do
    resources :goals
  end

  root 'pages#home'
end
