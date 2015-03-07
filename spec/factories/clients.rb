FactoryGirl.define do
  factory :client do
    invoice_id { Faker::Number.number(9).to_i }
    fiscal_id { Faker::Number.number(9).to_i }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
