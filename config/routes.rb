Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only:[:index,:new,:create,:destroy,:edit]
  resources :users, only:[:index]

end