Blocipedia::Application.routes.draw do

  devise_for :users
  resources :wikis
  resources :subscriptions
  resources :users, only: [:show]

  match "about" => 'welcome#about', via: :get

  # authenticated :user do
  #   root to: 'wikis#index'
  # end
  authenticated :user do 
    root to: 'wikis#index'
  end
  root to: 'welcome#index'
end
