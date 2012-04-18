Dummy::Application.routes.draw do
  resources :sample, :only => :index
  root :to => 'sample#index'
end
