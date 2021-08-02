Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :listings
  resources :events
  devise_for :admins
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#home'
  get 'pages/restricted'
  # get '/success', to: "payments#success", as: "payment_success"
  # post '/payments/webhook', to: "payments#webhook", as: "webhook"
  # post '/payments', to: "payments#create_payment_intent", as: "create_payment_intent"
end
