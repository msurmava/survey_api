require 'securerandom'

FactoryBot.define do
  factory :question do
    inquiry{  FactoryBot.create(:inquiry) }
    body { SecureRandom.alphanumeric(5) }
    optional { false }
  end


end
