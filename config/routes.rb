Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'


  get 'dashboard', to: 'dashboard#index'

  namespace :dashboard do
    resources :estates do
      resources :buildings, only: [:new ,:create] do
        resources :apartments do
        end
      end
    end
  end

  resources :enotifications
  resources :bnotifications
  resources :anotifications

  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
