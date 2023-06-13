Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  
  resources :trips do
    resources :pit_stops, only: [:new, :create, :edit, :update, :destroy]
  end
end
