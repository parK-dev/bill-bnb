Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :locations, only: [:index, :show, :new, :create] do
    resources :booking, only: [:create]
  end
  resources :bookings, only: [:index, :update]



end
