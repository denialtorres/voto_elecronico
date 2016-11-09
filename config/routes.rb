Rails.application.routes.draw do
  resources :petitions
  get 'petitions/public/:public_fragment', to: 'petitions#show', as: 'public_petition'
  get 'petitions/private/:private_fragment', to: 'petitions#show', as: 'private_petition'
  post 'services/mifiel', to: 'services#mifiel_callback'

  root to: 'petitions#index'
end
