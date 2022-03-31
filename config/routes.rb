Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/nosmetiers", to: "pages#nosmetiers", as: "nosmetiers"
  get "/contact", to: "pages#contact", as: "contact"

  resources :projects do
    resources :jointures, only: [:create, :update, :destroy]
  end
  resources :categories, only: [:index, :create, :destroy, :new]
end
