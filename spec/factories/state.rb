FactoryGirl.define do
  factory :state do
    sequence(:name) { |n| "Westeros-#{n}" }
    acronym 'WE'
  end
end
