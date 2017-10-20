Rails.application.routes.draw do

  resources :users
  
  # forward requests to the embedded ember app at /frontend
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end
end
