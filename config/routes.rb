Blocipedia::Application.routes.draw do

  devise_for :users
  resources :wikis
  resources :subscriptions, only: [:new, :create, :destroy]
  resources :users, only: [:show]

  get "about" => 'welcome#about'

  # authenticated :user do
  #   root to: 'wikis#index'
  # end
  authenticated :user do
    root to: 'wikis#index'
  end
  root to: 'welcome#index'
end