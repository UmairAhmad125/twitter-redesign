Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  get 'users/show'
  get 'users/all'
  resources :opinion
  post 'home/follow'
  root to: 'home#index'
end
