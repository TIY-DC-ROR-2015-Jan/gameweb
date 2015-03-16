Rails.application.routes.draw do
  devise_for :users

  resources :tic_tac_toes, only: [:new, :create, :show, :update]
end
