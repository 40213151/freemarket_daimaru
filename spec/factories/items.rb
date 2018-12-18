FactoryGirl.define do
  factory :item do
    name Faker::String.random(6..19)
    price rand(201..9999999)
  end
end
