Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'


  get 'dashboard', to: 'dashboard#index'

  namespace :dashboard do
    resources :estates do
      resources :buildings do
        resources :apartments do
        end
      end
    end
  end

  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
