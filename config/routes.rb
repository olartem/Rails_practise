Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :microposts do 
      member do
        post 'like' => 'microposts#like'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :microposts
  resources :home
  resources :secret
  root 'home#index'
end
