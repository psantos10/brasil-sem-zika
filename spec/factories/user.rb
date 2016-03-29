FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
    first_name 'John'
    last_name 'Doe'
    cpf '09000000000'
    address 'São Paulo, SP'
  end
end
