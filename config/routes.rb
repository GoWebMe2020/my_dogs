Rails.application.routes.draw do
  root to: 'pages#index'
  resources :dogs
  post "/dog", to: "dogs#dog", as: :request_dog
  get "/dog_list", to: "dogs#dog_list"
  get 'store_and_show_dog', to: 'dogs#store_and_show_dog'
end
