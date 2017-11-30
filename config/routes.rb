Rails.application.routes.draw do

  resources :messages
  resources :users

  # setup path for clients to connect to ActionCable
  #  for broadcasting of posted messages
  mount ActionCable.server => '/cable'

  # forward requests to the embedded ember app at /frontend
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end
end
