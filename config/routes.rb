# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  get 'users/show'
  get 'users/all'
  resources :opinion
  post 'home/follow'
  post 'home/unfollow'
  root to: 'home#index'
end
