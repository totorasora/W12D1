Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    resources :pokemon, only: [:index, :create, :show, :update] do
      # get '/pokemon/types', to: 'pokemon#types', as: 'pokemon_types'
      get "types", on: :collection
      resources :items, only: [:index, :create]
    end
    resources :items, only: [:update, :destroy]
  # define routes here to include them in the api namespace
  end



end
