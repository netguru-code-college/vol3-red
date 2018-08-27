Rails.application.routes.draw do
  get '/dashboard' , to: 'dashboard#index'
  devise_for :users
  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
