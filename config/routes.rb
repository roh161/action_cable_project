Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :messages, only: [:create]

  root 'messages#index'
end
