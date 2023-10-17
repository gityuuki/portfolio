Rails.application.routes.draw do
  devise_for :users

  resources :recruitments, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
    resources :recruitment_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
  end
  post 'users/withdrawal/:user_id', to: 'users#withdrawal', as: 'withdrawal'
  root "homes#top"
  get "home/about"=>"homes#about"
  get '/homes/guest_login', to: 'homes#guest_login'
  get "search" => "searches#search"

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end