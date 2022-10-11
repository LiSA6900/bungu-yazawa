Rails.application.routes.draw do
  
  root to: "public/homes#top"
  
  scope module: :public do
    resources :inquiries, only: [:new, :index, :show, :create]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/' => "homes#top"
    resources :schedules, only: [:index, :show, :destroy]
    resources :inquiries, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
