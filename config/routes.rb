Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "up" => "rails/health#show", :as => :rails_health_check

  resources :confirmations, only: [:new]
  resource :dashboard, only: [:show]
  resources :posts, only: [:show]

  root "dashboard#show"
end
