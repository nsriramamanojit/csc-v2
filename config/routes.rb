CscV2::Application.routes.draw do

  resources :users do
    get :approve, :on=>:member
  end

  resources :roles do
    get :approve, :on=>:member
  end

  resources :panchayats do
    get :approve, :on=>:member
  end

  resources :blocks do
    get :approve, :on=>:member
  end

  resources :districts do
    get :approve, :on=>:member
  end

  resources :divisions do
    get :approve, :on=>:member
  end

  resources :states do
    get :approve, :on=>:member
  end
  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "user_sessions#new"


  # root :to => "welcome#index"
  match ':controller(/:action(/:id(.:format)))'
end
