Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:create, :index, :show, :destroy] do
      resources :groups, only: [:index, :show, :create, :destroy] do
        resources :proceedings, only: [:new, :show, :create, :destroy]
      end
  end
end
