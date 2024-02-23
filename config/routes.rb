Rails.application.routes.draw do
  get 'pages/home'
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "lists#index"

  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]
end
