require 'securerandom'

FactoryBot.define do
  factory :responder do
    code { SecureRandom.alphanumeric(7) }
  end
end
