Blocipedia::Application.routes.draw do
  
  devise_for :users
  resources :wikis

  match "about" => 'welcome#about', via: :get

  # authenticated :user do
  #   root to: 'wikis#index'
  # end

  root to: 'wikis#index'
end
