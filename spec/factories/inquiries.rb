require 'securerandom'

FactoryBot.define do
  factory :inquiry do
    name { SecureRandom.alphanumeric(5) }
    research_id { FactoryBot.create(:research).id }
  end
end
