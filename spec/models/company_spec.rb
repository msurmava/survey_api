require 'rails_helper'

RSpec.describe Company, type: :model do
   let(:company) {FactoryBot.create(:company)}

  context 'name' do
   it { expect(company.name).to be_kind_of(String)}

   it { expect(company).to be_valid}
   
   it { expect(FactoryBot.build(:company, name: '')).not_to be_valid}
  end

  it 'has unique name' do
    expect{FactoryBot.create(:company, name: company.name)}.to raise_error
  end

  context 'associations' do
    it 'users/employees' do
      expect(company.users).not_to be(nil)
    end

    it 'has researches collection' do
      expect(company.researches).not_to be(nil)
    end

    it "should have many researches" do
      subject { described_class.new }
      assc = described_class.reflect_on_association(:researches)
      expect(assc.macro).to eq :has_many
    end
  end
  

  
end
