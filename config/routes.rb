Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy', as: :logout

  concern :likable do
    resources :likes, only: :create
  end

  resources :ideas, concerns: :likable, only: [:show, :create, :destroy] do
    resources :comments, concerns: :likable, only: [:create, :destroy]
  end

  match '*path' => 'application#error404', via: :all
end
