FactoryBot.define do
  factory :answer do
    responder { FactoryBot.create(:responder)}
    question { FactoryBot.create(:question) }
    option { FactoryBot.create(:option) }
    text { Faker::Lorem.sentence(word_count: 3)  }
  end  
end
