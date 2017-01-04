FactoryGirl.define do
  factory :user do
    # toDo: fix this up, not sure because I don't have internet right now
    email { Faker::Internet.email(username) }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end
end
