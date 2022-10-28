FactoryBot.define do
  factory :answerresponder do
    responder_id { FactoryBot.create(:responder).id}
    answer_id { FactoryBot.create(:answer).id}
  end
end
