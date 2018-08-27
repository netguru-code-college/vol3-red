Rails.application.routes.draw do
  match "/dashboard", to: "dashboard#index", :via => 'get'
  devise_for :users
  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
