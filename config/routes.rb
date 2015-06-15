Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  resources :recipes do
    member do
      post 'like'
    end
  end
  
  
  resources :chefs, except: [:new]
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: "login#new"
  post '/login', to: "login#create"
  get '/logout', to: "login#destroy"
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
end
