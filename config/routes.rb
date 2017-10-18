Rails.application.routes.draw do

  # forward requests to the embedded ember app at /frontend
  Rails.application.routes.draw do
    mount_ember_app :frontend, to: "/"
  end
end
