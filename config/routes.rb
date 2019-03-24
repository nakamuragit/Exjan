Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    resources :users
    get '/projects/search', to: 'projects#search'
    resources :projects
    resources :orders
    root "projects#index"
  end
  get 'homes/login'
  root "homes#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
