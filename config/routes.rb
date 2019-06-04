Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :show, :update]
        resources :animals, only: [:index, :show, :update]

        # route to login
        post "/login", to: "auth#login"

        # login on refresh
        get '/auto_login', to: "auth#auto_login"
      end
    end
  end
end
