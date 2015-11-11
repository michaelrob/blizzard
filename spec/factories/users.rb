FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.last_name }
    email { Faker::Internet.email(first_name) }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end
end
