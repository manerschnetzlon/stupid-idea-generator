Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :ideas, only: %i[index show create] do
    resources :likes, shallow: true, only: %i[create destroy]
  end

  get 'profile', to: 'dashboard#profile'
end
