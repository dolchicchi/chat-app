Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  root to: "rooms#index"
  resources :users
  resources :rooms do
    resources :messages, only: [:index, :new, :create]
  end
end
