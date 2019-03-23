Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    resources :users
    resources :projects
    resources :orders
    # post "users/channel"
    root "projects#index"
  end
  get 'homes/login'
  root "homes#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
