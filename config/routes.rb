Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "up" => "rails/health#show", :as => :rails_health_check

  resource :dashboard, only: [:show]

  root "dashboard#show"
end
