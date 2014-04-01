DebegIdea::Application.routes.draw do
  root to: 'welcome#index'
  resources :ideas, only: [:show, :create] do
    resources :comments, only: :create
  end
end
