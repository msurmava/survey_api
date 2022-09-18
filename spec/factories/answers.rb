FactoryBot.define do
  factory :answer do
    responder_id { FactoryBot.create(:responder).id }
    question_id { FactoryBot.create(:company).id  }
    option_id { FactoryBot.create(:option).id }
    text { "MyString" }
  end

  factory :answer_for_optional do
    responder_id { FactoryBot.create(:responder).id }
    question_id { FactoryBot.create(:company).id  }
    option_id { FactoryBot.create(:option).id }
    text { '' }
  end

  factory :answer_for_non_optional do
    responder_id { FactoryBot.create(:responder).id }
    question_id { FactoryBot.create(:company).id  }
    option_id { '' }
    text { "MyString" }
  end

  
end
