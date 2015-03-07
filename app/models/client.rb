class Client < ActiveRecord::Base

  validates :invoice_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :fiscal_id, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }

  after_create :notify_bahamas_gov

  private

  def notify_bahamas_gov
    stub_request(:get, 'https://www.bahamas.gov/register')
           .with(query: { invoice_id: invoice_id, fiscal_id: fiscal_id, name: name, email: email })
           .to_return(status: 200, body: "Greetings! Information saved – #{email} / #{name} / #{fiscal_id} / #{invoice_id}")
    response = RestClient.get 'https://www.bahamas.gov/register', params: { invoice_id: invoice_id, fiscal_id: fiscal_id, name: name, email: email }
    WebMock.reset!
    response
  end

end