FactoryGirl.define do
  factory :story_group do
    title { Faker::Commerce.color }
    description { Faker::Lorem.sentence }
  end
end
