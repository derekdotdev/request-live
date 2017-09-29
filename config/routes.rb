Rails.application.routes.draw do
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/thank-you', to: 'requests#thank_you'
end
