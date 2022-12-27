Rails.application.routes.draw do
  resources :items
  get '/deleted_items/:id/edit', to: 'deleted_items#edit', as: 'edit_deleted'
  get '/deleted_items', to: 'deleted_items#index'
  patch '/deleted_items/:id', to: 'deleted_items#update', as: 'deleted'
  post '/deleted_items/:id', to: 'deleted_items#create'
  delete '/deleted_items/:id', to: 'deleted_items#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
end
