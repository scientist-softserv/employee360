Rails.application.routes.draw do
  devise_for :users

  get '/users/:id', to: 'users#show', as: 'user'
  # get 'users/show'
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
