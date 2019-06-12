Rails.application.routes.draw do
  # devise_for :users
  resources :posts, only:[:index]
  resources :users, only:[:index]

end
