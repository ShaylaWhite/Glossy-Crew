Rails.application.routes.draw do
  get '/' => 'sessions#home'
  
  
  resources :reviews
  resources :lip_glosses
  resources :sponsors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
