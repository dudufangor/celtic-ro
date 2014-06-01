CelticRo::Application.routes.draw do
  # login/logout
  root to: 'users#new'

  get 'home' => 'home#index', as: :home
  get  'register' => 'users#new', as: :register
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
  post 'create' => 'user_sessions#create', as: :user_sessions

  resources :users, only: [:new, :create]
  get 'users/edit' => 'users#edit', as: :user_edit
  get 'users/show' => 'users#show', as: :user
  get 'users/reset_char/:name' => 'users#reset', as: :reset_char
  patch 'users' => 'users#update'
end
