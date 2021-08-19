Rails.application.routes.draw do
  get 'conversations/index'
  resources :profiles
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :variants do
    collection do
      get 'get_models', to: 'variant#get_models'
    end 
  end

  resources :listings

  get '/events/(:id)', to: 'events#index' # Changes typical events#show to events#index
  patch '/events/:id/confirm', to:'events#change_confirmed', as: 'change_confirmed_event'
  resources :events do
    # collection do
    #   patch :change_confirmed
    # end

    member do
      patch :toggle_confirmed_status
    end
  end
  
  # devise_for :admins#, controllers: { sessions: 'admins/sessions' }
  devise_for :users#, controllers: { sessions: 'users/sessions' }
  # skip: :all - enables current_user helper methods 
  # , path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, skip: :all

  root to: 'pages#home'
  get 'messages/inbox'
  get 'conversations/index'
  post '/conversations', to: 'conversations#create', as: 'create_conversation'
  get 'success', to: 'payments#success', as: 'payment_success'
  post '/payments/webhook', to: 'payments#webhook', as: 'webhook'
  post '/payments', to: 'payments#create_payment_intent', as: 'create_payment_intent'
  post '/listings/(:id)', to: 'listings#update', as: 'update_listing'
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
  post 'watches', to: 'watches#create', as: 'create_watch'
  delete '/watches/(:id)', to: 'watches#destroy', as: 'delete_watch'
end
