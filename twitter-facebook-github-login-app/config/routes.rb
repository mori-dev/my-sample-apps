TwitterLoginApp::Application.routes.draw do

  root :to => 'welcome#index'

  get "welcome/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  # devise_scope :user do
  #   get 'logout' => 'users/sessions#destroy'
  #   get 'change_format' => 'users/sessions#change_format'
  # end

end
