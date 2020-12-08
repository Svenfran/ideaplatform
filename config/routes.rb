Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]
  resources :idea_problems do
    resources :attachments
    resources :contact_messages, only: [:new, :create]
    get 'idea_problems/:id/contact_messages/confirmation', to: 'contact_messages#confirmation', as: 'confirmation'
  end
  resources :contact_messages, only: [:destroy]
  resources :categories
  resources :attachments, only: [:destroy]

end
