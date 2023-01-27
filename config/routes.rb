Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "posts#index"

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :likes, only: %i[create destroy]
end
