CscV2::Application.routes.draw do

  resources :districts do
    get :approve, :on=>:member
  end

  resources :divisions do
    get :approve, :on=>:member
  end

  resources :states do
    get :approve, :on=>:member
  end

  # root :to => "welcome#index"
  # match ':controller(/:action(/:id(.:format)))'
end
