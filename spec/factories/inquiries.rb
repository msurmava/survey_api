FactoryBot.define do
  factory :inquiry do
    name { "MyString" }
    research_id { FactoryBot.create(:research).id }
  end
end
