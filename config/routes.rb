Firefly::Application.routes.draw do
  authenticated :user do
    root :to => 'torrents#index'
    resources :torrents
  end
  match "/uploads/*path" => "gridfs#serve"
  root :to => "torrents#index"
  devise_for :users
  resources :users
end