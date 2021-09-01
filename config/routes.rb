Rails.application.routes.draw do
  get 'students/show'
  get 'students/index'
  devise_for :users

  resources :students, only: [:index, :show]
  resources :gigs

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
