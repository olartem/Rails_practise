Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :microposts

      root to: "users#index"
    end
  devise_for :users
  resources :users, except: [:index] do
    resources :microposts do 
      member do
        post 'like' => 'microposts#like'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :microposts, only:[:index]
  resources :home
  resources :secret
  root 'home#index'
end
