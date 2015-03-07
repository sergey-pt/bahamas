class Client < ActiveRecord::Base

  validates :invoice_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :fiscal_id, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }

end