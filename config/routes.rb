Rails.application.routes.draw do

  root 'clients#index'

  def api_version(version, &routes)
    api_constraint = ApiConstraint.new(version: version)
    scope(module: "v#{version}", constraints: api_constraint, &routes)
  end

  defaults format: 'json' do
    api_version(1) do
      resources :clients, only: [:show, :create]
      get 'retrieve-bahamas-client/:invoice_id', to: 'clients#show'
      post 'store-bahamas-client/:invoice_id', to: 'clients#create'
    end
  end

end
