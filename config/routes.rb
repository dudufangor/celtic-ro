CelticRo::Application.routes.draw do
  root to: 'home#index'
  resources :users do
  end
end
