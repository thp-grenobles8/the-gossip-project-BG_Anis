Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/team', to: 'static#team'

  get '/contact', to: 'static#contact'

  resources :gossips do
 
  resources :comments, except: [:show]  
  
  end
  
  resources :users, only: [:show]

  resources :cities, only: [:show]

  get '/welcome', to: 'dynamic#welcome'

  get '/welcome/:name', to: 'dynamic#welcome'
end
