Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  get 'static_pages/contact'
  get 'static_pages/cookiepolicy'
end
