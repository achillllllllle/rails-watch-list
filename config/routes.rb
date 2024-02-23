Rails.application.routes.draw do
  get 'pages/home'
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "pages#home"

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]
end
