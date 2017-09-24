Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:index, :create, :update, :destroy]
  end
end
