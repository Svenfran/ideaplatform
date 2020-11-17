Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :idea_problems do
    resources :attachments
  end
  resources :attachments, only: [:destroy]
  resources :categories

end
