Rails.application.routes.draw do
  get 'users/create'

  devise_for :users
  resources :jobs

  root 'jobs#index'

end
