Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_omniauth/callback' => 'sessions#omniauth'
  
  resources :reviews
  resources :lip_glosses do
    resources :reviews, only: [:new, :index, ]
  end 
  resources :sponsors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
