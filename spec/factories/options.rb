FactoryBot.define do
  factory :option_correct do
    question_id { FactoryBot.create(:queston_optional).id }
    correct { true }
    body { "MyString" }
  end
  factory :option_wrong do
    question_id { FactoryBot.create(:queston_optional).id }
    correct { false }
    body { "MyString" }
  end
end
