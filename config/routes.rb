Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/cv'
  root 'welcome#index'

  get '*path' => redirect('/')
  
end
