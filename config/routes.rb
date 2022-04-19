Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  get "signup",to: "users#new"
  resources :users,only: [:create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :agents, only: [:new, :create, :show, :destroy] do
    resources :posts, only: [:index, :new, :create, :destroy]
  end
  
end
