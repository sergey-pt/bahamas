describe "Clients API" do
  it 'retrieves a specific Client' do
    client = FactoryGirl.create(:client)
    get "/retrieve-bahamas-client/#{client.invoice_id}", nil, { 'HTTP_ACCEPT' => 'application/json; version=1' }

    expect(response).to be_success
    expect(json.except('created_at', 'updated_at')).to eq(client.as_json.except('created_at', 'updated_at'))
  end

  it 'stores a new Client' do
    expect(Client.find_by_invoice_id(999)).to eq(nil)

    new_client_parameters = { 'invoice_id' => 999, 'fiscal_id' => 5555, 'name' => 'Sergei', 'email' => 'sergei@anisimov.co' }
    post "/store-bahamas-client/#{new_client_parameters['invoice_id']}", new_client_parameters.except('invoice_id'), { 'HTTP_ACCEPT' => 'application/json; version=1' }

    expect(response).to be_success
    expect(json.except('id', 'created_at', 'updated_at')).to eq(new_client_parameters)

    stored_client = Client.find_by_invoice_id(999)
    expect(stored_client.as_json.except('id', 'created_at', 'updated_at')).to eq(new_client_parameters)
  end

  it 'gets an errors with a wrong new Client parameters' do
    new_client_parameters = { 'invoice_id' => 999, 'fiscal_id' => 5555, 'name' => 'Sergei', 'email' => 'sergeianisimov.co' }
    post "/store-bahamas-client/#{new_client_parameters['invoice_id']}", new_client_parameters.except('invoice_id'), { 'HTTP_ACCEPT' => 'application/json; version=1' }

    expect(response).to be_unprocessable
    expect(json['errors']).to eq(['Email is invalid'])
  end
end