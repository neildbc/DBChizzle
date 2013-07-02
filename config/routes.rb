Karmaville::Application.routes.draw do
  resources :users, :only => [:index]

  root :to => 'users#index'

  match '/page' => 'users#page'
end
