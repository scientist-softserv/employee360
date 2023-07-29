Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'users/passwords' }

  get '/users/:id', to: 'users#show', as: 'user'

  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
