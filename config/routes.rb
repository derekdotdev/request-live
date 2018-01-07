Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	root to: 'requests#new'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/thank-you', to: 'requests#thank_you'
  get '/persisted', to: 'home#persisted'
  get '/failure', to: 'home#failure'
  get '/new-user', to: 'home#new_user'
  get '/privacy', to: 'home#privacy'
end
