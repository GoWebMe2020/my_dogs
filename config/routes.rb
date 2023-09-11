Rails.application.routes.draw do
  root to: 'pages#index'
  resources :dogs
  post "/dog", to: "dogs#dog", as: :request_dog
end
