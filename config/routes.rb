Rails.application.routes.draw do
  
  root to: "public/homes#top"
  
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :inquiries, only: [:new, :index, :show, :create]
    get "customers" => "customers#index"
    get "customers/my_page" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
  end
  
  #ゲストログインのためのルーティング
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#new_guest'
  end
  
  
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/" => "homes#top"
    get "search" => "inquiries#search"
    resources :inquiries, only: [:show, :update, :index]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :schedules
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
