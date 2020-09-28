Rails.application.routes.draw do
  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#create'
  post '/signup' => 'users#create'
  
  resources :reviews
  resources :lip_glosses
  resources :sponsors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
