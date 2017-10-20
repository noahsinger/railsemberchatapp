Rails.application.routes.draw do

  resources :messages
  resources :users
  
  # forward requests to the embedded ember app at /frontend
  Rails.application.routes.draw do
  resources :messages
    mount_ember_app :frontend, to: "/"
  end
end
