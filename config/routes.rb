Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :reviews, only: [:new, :index, :create]

  resources :lip_glosses do
    resources :reviews, only: [:new, :index]  
  end 

  resources :sponsors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
