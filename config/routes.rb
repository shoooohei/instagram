Rails.application.routes.draw do

  resources :pictures do
    collection do
      post :confirm
      get :cancel
    end
  end


  resources :other_comments, only: [:edit, :create, :update, :destroy] do
    member do
      get :cancel
    end
  end

  resources :users, only: [:new, :create, :show]
  resources :user_icons, only: [:create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
