Rails.application.routes.draw do
  devise_for :users

  post 'auth_user' => 'authentication#authenticate_user'

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
