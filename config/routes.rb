Firefly::Application.routes.draw do
  resources :messages
  
  devise_for :users
  
  root :to => 'torrents#index'
  authenticated :user do
    root :to => 'torrents#index'
    resources :torrents do
      resource :controls
      resources :comments
      match "/like",    on: :member, controller: :likes, action: :like
      match "/unlike",  on: :member, controller: :likes, action: :unlike
      
    end
    resources :users do
      match "switch_theme/:name", on: :collection, action: :switch_theme
    end
  end

  match "/uploads/*path" => "gridfs#serve"

end