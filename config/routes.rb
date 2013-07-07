RoboCommish::Application.routes.draw do
  root :to => 'leagues#index'
  resources :leagues, only: [:index, :new, :show, :create] do
    resources :members, only: [:new, :create]
  end
end
