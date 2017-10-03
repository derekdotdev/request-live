Rails.application.routes.draw do
  devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 	devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	end
	root to: 'requests#new'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/thank-you', to: 'requests#thank_you'
end
