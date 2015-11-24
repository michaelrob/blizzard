FactoryGirl.define do
  factory :user do
    username { Faker::Address.city }
    email { Faker::Internet.email(username) }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end
end
