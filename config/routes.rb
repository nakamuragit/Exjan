Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  authenticated :user do
    resources :users
    get '/projects/search', to: 'projects#search'
    resources :projects
    resources :orders
    root "projects#index"
  end
  get "/homes/forcom", to: "homes#forcom"
  root "homes#home"
end
