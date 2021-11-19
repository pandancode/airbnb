Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "transactions", to: "transactions#index"
<<<<<<< HEAD
  get "search", to: "pokemons#search", alias: :search
  resources :pokemons, only: [:index, :show, :new, :create, :destroy] do
=======
  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
>>>>>>> 2d2151e1622a41c93c6a5eeecf8f386d40ee7b69
    resources :transactions, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
