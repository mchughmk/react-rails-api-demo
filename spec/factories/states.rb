FactoryGirl.define do
  factory :state do
    code { Faker::Address.state_abbr }
    name { Faker::Address.state }
    country nil
  end
end