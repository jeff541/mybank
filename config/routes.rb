Rails.application.routes.draw do
  resources :dettes do
    get 'set_amount', on: :member
    patch 'update_amount', on: :member
  end
  resources :comptes do
    get 'set_amount', on: :member
    patch 'update_amount', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "comptes#index"
end
