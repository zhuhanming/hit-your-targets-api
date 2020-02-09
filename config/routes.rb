Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new("v1", true) do
    resources :todos do
      resources :subtodos
    end
  end

  post "auth/login", to: "authentication#authenticate"
  get "auth/me", to: "users#show"
  post "signup", to: "users#create"
  patch "update_user", to: "users#update_user"
  patch "update_user_password", to: "users#update_user_password"
end
