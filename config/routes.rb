Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :users

  get 'home/about', to: 'homes#about'  # ルーティングを変更

  resources :users, only: [:show, :create, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
