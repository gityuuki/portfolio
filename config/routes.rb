Rails.application.routes.draw do
  get 'relationships/followers'
  get 'relationships/followings'
  get 'users/edit'
  get 'users/index'
  get 'users/show'
  get 'recruitments/edit'
  get 'recruitments/index'
  get 'recruitments/show'
  devise_for :users
  root "homes#top"
    get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
