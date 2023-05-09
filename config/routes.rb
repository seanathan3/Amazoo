Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'api/test', to: 'application#test'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :show] do
      resources :cart_items, only: :index
    end
    
    resource :session, only: [:show, :create, :destroy]
    
    get 'items/search/:query', to: 'items#search'
    resources :items, only: [:index, :show] do
      resources :reviews, only: :index
    end

    post 'cart_items/transfer', to: 'cart_items#transfer'
    
    resources :cart_items, only: [:create, :update, :destroy]
    
    resources :reviews, only: [:create, :update, :destroy, :show]
  end
  
  get '*path', to: "static_pages#frontend_index"
end
