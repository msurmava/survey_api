require 'rails_helper'

RSpec.describe Researchcompany, type: :model do  
  let(:research1) {FactoryBot.create(:research)}
  let(:company1) {FactoryBot.create(:company)}
  let(:researchcompany) {FactoryBot.create(:researchcompany, research: research1, company: company1)}
  
  context 'basic' do
    it { expect(FactoryBot.create(:researchcompany)).to be_valid}

    it { expect(researchcompany).to be_valid}
  end

  context 'associations' do
    research2 = FactoryBot.create(:research)
    company2 = FactoryBot.create(:company)
    researchcompany = FactoryBot.create(:researchcompany, research: research2, company: company2)

    it { expect(research2.companies.collect(&:name)).to include(company2.name)}

    it { expect(company2.researches.collect(&:name)).to include(research2.name)}
  end

end
