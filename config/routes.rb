DebegIdea::Application.routes.draw do
  root to: 'welcome#index'
  resources :ideas, only: :create
end
