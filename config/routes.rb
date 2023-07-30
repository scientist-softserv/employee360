Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'users/passwords' }

  get '/users/:id', to: 'users#show', as: 'user'

  resources :users do
    resources :goals
    member do
      get 'edit', to: 'users#edit'
      patch 'update', to: 'users#update'
    end
  end

  root 'pages#home'
end
