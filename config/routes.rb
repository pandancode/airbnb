Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "transactions", to: "transactions#index"
  get "search", to: "pokemons#search", alias: :search
  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
