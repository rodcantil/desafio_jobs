Rails.application.routes.draw do
  resources :offers
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [ :index, :new ]

  post "/postulations", to: "postulations#user_postulation", as: "user_postulation"
  get "/my_postulations", to: "postulations#offer_with_postulations", as: "my_postulations"
  get "/list_users", to: "users#index", as: "my_users"
  get "/show_user/:id", to: "users#show", as: "user"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "offers#index"
end
