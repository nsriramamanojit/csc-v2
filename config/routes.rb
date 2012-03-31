CscV2::Application.routes.draw do

  resources :generals

  get "user_info/index"

  resources :users do
    get :approve, :on=>:member
    get :profile, :on=>:member
    get :profile_edit, :on=>:member
    put :profile_update, :on=>:member
    get :change_password,:on=>:member
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
  match "user_info/:id" => "user_info#index", :as=>:user_info


  # root :to => "welcome#index"
  match ':controller(/:action(/:id(.:format)))'
end
