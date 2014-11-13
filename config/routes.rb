Rails.application.routes.draw do
  namespace :api do
    resources :shots, only: [:create]
  end

  root to: redirect('http://www.annict.com')
end
