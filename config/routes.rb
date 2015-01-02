Rails.application.routes.draw do
  #root to: 'visitors#index'
  root to: 'visitors#landing'
  get 'visitors/landing'
  get 'visitors/index'
  devise_for :users
  resources :users
end
