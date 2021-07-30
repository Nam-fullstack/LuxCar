Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/restricted'
  resources :listings
  resources :events
  devise_for :users
  root to: 'pages#home'
  # get '/success', to: "payments#success", as: "payment_success"
  # post '/payments/webhook', to: "payments#webhook", as: "webhook"
end
