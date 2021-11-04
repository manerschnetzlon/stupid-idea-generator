Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :ideas, only: %i[index show create]
  # get 'generate', to: 'ideas#generate'
end
