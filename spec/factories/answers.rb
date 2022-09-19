FactoryBot.define do
  factory :answer do
    question { FactoryBot.create(:question) }
    text { Faker::Lorem.sentence(word_count: 3)  }
  end  
end
