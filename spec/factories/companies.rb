require 'securerandom'

FactoryBot.define do
  factory :company do
    name { SecureRandom.alphanumeric(5) }
  end
end
