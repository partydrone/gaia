Rails.application.routes.draw do
  root 'home#index'

  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'

  get 'dashboard', to: 'dashboard#index'
end
