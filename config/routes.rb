Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :recipes, only: [:index, :show, :destroy]
    get "/check" => "recipes#check"
    resources :users, only: [:show, :edit, :update]
  end

  scope module: :user do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :users, only: [:show, :edit, :check, :update, :withdraw]
    get "/users/check" => "users#check"
    patch "users/withdraw" => "users#withdraw"
    resources :recipes, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :recipe_comments, only: [:create, :destroy]
      resources :cooking_methods, only: [:create, :destroy]
      resources :ingredients, only: [:create, :destroy]
      resources :ingredient_details, only: [:create, :destroy]
    end
    get "users/check" => "recipes#check"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
