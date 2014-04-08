Blocipedia::Application.routes.draw do
  
  get "subscriptions/new"

  get "subscriptions/create"

  devise_for :users
  resources :wikis
  resources :subscriptions

  match "about" => 'welcome#about', via: :get

  # authenticated :user do
  #   root to: 'wikis#index'
  # end

  root to: 'wikis#index'
end
