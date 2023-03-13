Rails.application.routes.draw do
  get 'reviews/new'
  get 'profile', to: 'pages#profile', as: :profile
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :reviews, except: [:index]
  end

  resources :users, only: [:show]
  # Defines the root path route ("/")
  # root "articles#index"
end
