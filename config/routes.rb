Rails.application.routes.draw do  
  # devise_for :admins#, controllers: { sessions: 'admins/sessions' }
  devise_for :users #, controllers: { sessions: 'users/sessions' }
  # skip: :all - enables current_user helper methods 
  # , path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, skip: :all

  root to: 'pages#home'
  get 'messages/inbox'
  get 'conversations/index'
  get 'success', to: 'payments#success', as: 'payment_success'
  post '/payments/webhook', to: 'payments#webhook', as: 'webhook'
  post '/payments', to: 'payments#create_payment_intent', as: 'create_payment_intent'
  post '/listings/(:id)', to: 'listings#update', as: 'update_listing'
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
  post 'watches', to: 'watches#create', as: 'create_watch'
  delete '/watches/(:id)', to: 'watches#destroy', as: 'delete_watch'

  resources :listings
  # route to send to listings controller filter from home page after selecting the Make
  get 'filtered', to: 'listings#filter', as: 'filter_listings'

  patch '/events/:id/confirm', to:'events#change_confirmed', as: 'change_confirmed_event'
  resources :events

  get 'conversations/index'
  resources :profiles, except: %i[ index ]
  resources :conversations, only: %i[ index create ] do
    resources :messages, only: %i[ index create ]
  end
  post '/conversations', to: 'conversations#create', as: 'create_conversation'
  resources :variants do
    collection do
      get 'get_models', to: 'variant#get_models'   # was trying to get dynamic forms working, coffee script doesn't work in Rails 6..
    end 
  end
end
