Rails.application.routes.draw do
  resources :petitions
  get 'petitions/public/:public_fragment', to: 'petitions#show'
  get 'petitions/private/:private_fragment', to: 'petitions#show'
end
