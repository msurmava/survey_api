FactoryBot.define do
  factory :queston_optional do
    inquiry_id {  FactoryBot.create(:inquiry).id }
    body { "MyString" }
    option { true }
  end

  factory :queston_non_optional do
    inquiry_id {  FactoryBot.create(:inquiry).id }
    body { "MyString" }
    option { false }
  end
end
