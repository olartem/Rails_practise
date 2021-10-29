Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :microposts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  resources :secret
  root 'home#index'
end
