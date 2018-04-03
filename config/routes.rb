Rails.application.routes.draw do
  root to: 'requests#new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users do
    resources :requests
  end

  resources :requests
  resources :entertainers, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/thank-you', to: 'requests#thank_you'
  get '/persisted', to: 'home#persisted'
  get '/failure', to: 'home#failure'
  get '/new-user', to: 'home#new_user'
  get '/privacy', to: 'home#privacy'
end
