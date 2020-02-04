Rails.application.routes.draw do

  get 'welcome/index'

  get '/login', to: 'login#login'
  post '/login', to: 'login#do_login'
  get '/logout', to: 'login#logout'

  resources :users

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
