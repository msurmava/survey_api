FactoryBot.define do
  factory :employment do
    user { FactoryBot.create(:user) }
    company{ FactoryBot.create(:company) }
  end
end
