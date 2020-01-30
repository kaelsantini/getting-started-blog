Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, only: [:index, :new, :create, :destroy]

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
