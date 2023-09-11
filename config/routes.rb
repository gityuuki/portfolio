Rails.application.routes.draw do
  root "public/homes#top"
  namespace :public do
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
