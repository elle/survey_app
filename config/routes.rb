Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "up" => "rails/health#show", :as => :rails_health_check

  # root "posts#index"
end
