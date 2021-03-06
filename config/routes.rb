Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :api do
    resources :countries, only: [:index] do
      resources :states, only: [:index]
    end
  end
end
