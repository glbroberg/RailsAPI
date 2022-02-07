Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # Option 1:
  # get '/articles', to: 'articles#index'

  # Option 2: Using Resources Helper
  resources :articles, only: [:index, :show] # This option creates actions for all CRUD actions

end
