Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'about', to: 'pages#about'
  resources :articles #scaffold to create predefined stuff
  resources :users
end
