Rails.application.routes.draw do
  resources :powers, only: [:show]
  resources :heroines, only: [:new, :create, :index, :show]
end
