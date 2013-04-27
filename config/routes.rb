Firefly::Application.routes.draw do
  authenticated :user do
    root :to => 'torrents#index'
    resources :torrents do
      resource :controls
      resources :comments
    end
  end
  match "/uploads/*path" => "gridfs#serve"
  root :to => "torrents#index"
  devise_for :users
  resources :users do
    match "switch_theme/:name", on: :collection, action: :switch_theme
  end
end