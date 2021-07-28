Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/restricted'
  devise_for :users
  root to: 'pages#home'
  # get '/success', to: "payments#success", as: "payment_success"
  # post '/payments/webhook', to: "payments#webhook", as: "webhook"
end
