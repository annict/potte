Rails.application.routes.draw do
  namespace :api do
    resources :shots, only: [:create]
  end
end
