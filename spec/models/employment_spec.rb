require 'rails_helper'

RSpec.describe Employment, type: :model do
  let(:employment) {FactoryBot.create(:employment)}
  let(:user) {FactoryBot.create(:user)}
  let(:company) {FactoryBot.create(:company)}

  it {  expect(employment).to be_valid}

  context 'with valid FKs' do
    
    it {  expect(employment.user).to be_valid}

    it {  expect(employment.company).to be_valid}
  end

  context 'with nil FKs' do 

    it {  expect(FactoryBot.build(:employment, user_id: '')).not_to be_valid}

    it {  expect(FactoryBot.build(:employment, company_id: '')).not_to be_valid}

    it {  expect(FactoryBot.build(:employment, user: user, company_id: '')).not_to be_valid}

    it {  expect(FactoryBot.build(:employment, user_id: '', company_id: company)).not_to be_valid}
  end


end
