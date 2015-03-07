Rails.application.routes.draw do

  defaults format: 'json' do
    resources :clients, only: [:show, :create]

    get 'retrieve-bahamas-client/:invoice_id', to: 'clients#show'
  end

end
