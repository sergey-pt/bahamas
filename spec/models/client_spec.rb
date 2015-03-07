require 'rails_helper'

RSpec.describe Client, type: :model do

  describe 'Validations' do

    it 'has a valid factory' do
      expect(build(:client)).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:client, name: nil)).to_not be_valid
    end

    it 'is invalid without a fiscal_id' do
      expect(build(:client, fiscal_id: nil)).to_not be_valid
    end

    it 'is invalid without an email' do
      expect(build(:client, email: nil)).to_not be_valid
    end

    it 'is invalid with a wrong format email' do
      expect(build(:client, email: 'testtest.com')).to_not be_valid
    end
  end

  describe '#notify_bahamas_gov' do
    subject { create(:client) }

    it 'returns 200 ok' do
      expect(subject.send(:notify_bahamas_gov)).to eq("Greetings! Information saved – #{subject.email} / #{subject.name} / #{subject.fiscal_id} / #{subject.invoice_id}")
    end
  end

end
