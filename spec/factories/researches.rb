require 'securerandom'

FactoryBot.define do
  factory :research do
    name {SecureRandom.alphanumeric(7)}
  end
end
