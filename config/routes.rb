Rails.application.routes.draw do
  get '/', to: "links#index"

  resources :links , except: [:edit, :update, :destroy ]
  
  get '/s/:slug', to: 'links#go'
end
