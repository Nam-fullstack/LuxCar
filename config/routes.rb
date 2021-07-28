Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # get '/success', to: "payments#success", as: "payment_success"
  # post '/payments/webhook', to: "payments#webhook", as: "webhook"
end
