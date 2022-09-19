require 'securerandom'
FactoryBot.define do
  factory :option do
    question{ FactoryBot.create(:question) }
    correct { false }
    body { SecureRandom.alphanumeric(5) }
  end
end
