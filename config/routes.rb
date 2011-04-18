PostmarkMittExample::Application.routes.draw do
  namespace :api do
    resources :posts, :only => [ :create ]
  end
  root :to => 'posts#index'
end
