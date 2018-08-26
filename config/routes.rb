Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'static_pages#welcome'
  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
