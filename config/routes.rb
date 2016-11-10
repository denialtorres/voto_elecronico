Rails.application.routes.draw do
  resources :petitions
  get 'petitions/public/:public_fragment', to: 'petitions#show'
  get 'petitions/private/:private_fragment', to: 'petitions#show'
  post 'services/mifiel', to: 'services#mifiel_callback'
end
