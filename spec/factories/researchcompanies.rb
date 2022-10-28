FactoryBot.define do
  factory :researchcompany do
    company_id { FactoryBot.create(:company).id}
    research_id { FactoryBot.create(:research).id }
  end
end
