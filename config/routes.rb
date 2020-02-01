Rails.application.routes.draw do

  get 'welcome/index'

  get '/login', to: 'login#login'
  post '/login', to: 'login#do_login'
  get '/logout', to: 'login#logout'

  resources :users, only: [:index, :new, :create, :destroy]

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
