FactoryGirl.define do
  factory :complaint do
    address 'MyString'
    cep 'MyString'
    after(:build) do |c|
      c.state = build(:state)
      c.city = build(:city)
    end
  end
end
