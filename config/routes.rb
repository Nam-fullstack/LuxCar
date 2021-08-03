Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :listings
  resources :events
  # skip: :all - enables current_user helper methods 
  devise_for :admins#, controllers: { sessions: 'admins/sessions' }
  devise_for :users#, controllers: { sessions: 'users/sessions' }
  # , path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, skip: :all

  root to: 'pages#home'
  get 'pages/restricted'
  # get '/success', to: "payments#success", as: "payment_success"
  # post '/payments/webhook', to: "payments#webhook", as: "webhook"
  # post '/payments', to: "payments#create_payment_intent", as: "create_payment_intent"
end
