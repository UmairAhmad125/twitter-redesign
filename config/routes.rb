Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :opinion
  root to: 'home#index'
end
