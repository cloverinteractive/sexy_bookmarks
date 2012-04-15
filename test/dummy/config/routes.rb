Dummy::Application.routes.draw do
  resources :sample, :only => [] do
    collection do
      get :test_with_defaults
    end
  end

  root :to => 'sample#test_with_defaults'
end
