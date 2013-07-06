RoboCommish::Application.routes.draw do
  root :to => 'leagues#index'
  resources :leagues, only: [:index, :new, :show, :create]
end
