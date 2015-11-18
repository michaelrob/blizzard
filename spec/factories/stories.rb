FactoryGirl.define do
  factory :story do
    title { Faker::Commerce.color }
    body { Faker::Lorem.sentence }
  end
end
