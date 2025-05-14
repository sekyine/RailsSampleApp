Rails.application.routes.draw do
  get "users/show"
  get "users/index"
  get "static_pages/home"
  root "static_pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  
  get "up" => "rails/health#show", as: :rails_health_check
  get '/auth/:provider/callback', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy' 
  get '/:nickname', to: 'users#show' 
  get 'users/index' 
  get '/:nickname/followers', to:'users#show_followers' 
  get '/:nickname/followings', to:'users#show_followings' 
  
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  post '/tweets/reply' 

  resources :tweets, only:[:create,:destroy,:show] 
  resources :follow_relationships, only:[:create,:destroy] 
  
end
