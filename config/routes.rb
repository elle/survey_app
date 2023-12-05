Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "up" => "rails/health#show", :as => :rails_health_check

  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :confirmations, only: [:new]
  resource :dashboard, only: [:show]
  resources :posts, only: [:show]
  resources :sessions, only: [:new, :create]

  root "dashboard#show"
end
