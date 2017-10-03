Rails.application.routes.draw do
  devise_for :users
	root to: 'requests#new'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/thank-you', to: 'requests#thank_you'
end
