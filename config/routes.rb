Rails.application.routes.draw do
  resources :petitions, exept: :edit do
    post :publish
    post :close
    get :show_signers
    get :sign
    resources :signers, only: [:create, :new]
  end
  patch 'petitions/:id/edit', to: 'petitions#update'
  get 'petitions/private/:private_fragment', to: 'petitions#show', as: 'private_petition'
  post 'services/mifiel/:token', to: 'services#mifiel_callback', as: 'petition_callback'

  root to: 'petitions#index'
end
