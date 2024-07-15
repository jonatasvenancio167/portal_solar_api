Rails.application.routes.draw do
  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations',
    passwords: 'clients/passwords'
  }
  
  devise_scope :client do
    get 'client', to: 'clients/sessions#index'
    get 'client/show', to: 'clients/sessions#show'
    put 'client/update', to: 'clients/registrations#update'
  end 

  resources :simulations, only: [:index, :create]
end
