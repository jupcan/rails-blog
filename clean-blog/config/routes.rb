Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'clean_blogs#index'
  get  'about' 	=> 'clean_blogs#about'
  get  'post' 	=> 'clean_blogs#post'
  resources :users
  resources :articles do
    resources :comments
  end
end
