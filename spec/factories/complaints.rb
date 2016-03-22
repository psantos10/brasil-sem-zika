FactoryGirl.define do
  factory :complaint do
    address Faker::Address.street_address
    cep Faker::Address.postcode
  end
end
