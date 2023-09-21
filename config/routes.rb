Rails.application.routes.draw do
  devise_for :users
  get 'relationships/followers'
  get 'relationships/followings'
  resources :recruitments, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]
  root "homes#top"
 get "home/about"=>"homes#about"
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
