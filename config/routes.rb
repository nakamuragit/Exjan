Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  post "/homes/create", to: "homes#create"
  authenticated :user do
    resources :users 
    get '/projects/search', to: 'projects#search'
    get '/projects/search/pay', to: 'projects#search_pay'
    get '/projects/search/period', to: 'projects#search_period'
    get '/projects/search/method', to: 'projects#search_method'
    get '/projects/search/site', to: 'projects#search_site'
    resources :projects
    resources :orders
    root "projects#index"
  end
  get "/homes/forcom", to: "homes#forcom"
  get "/homes/sign_up", to: "homes#sign_up"
  root "homes#home"
end
