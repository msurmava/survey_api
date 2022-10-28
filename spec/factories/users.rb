require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { "MyString" }
  end
end
