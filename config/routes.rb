Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :places, only: [:create, :update, :destroy, :index, :show] do
    resources :reviews, only: [:create, :destroy, :index]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
