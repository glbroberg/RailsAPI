Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # Option 1:
  # get '/articles', to: 'articles#index'

  # Option 2: Using Resources Helper
  # resources :article # By default, this creates routes for all CRUD actions
  resources :articles, only: [:index, :show] # This only creates 'get articles/' (index) and 'get articles/id' (show)

end
