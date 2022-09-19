require 'rails_helper'

RSpec.describe Research, type: :model do
  let(:research) {FactoryBot.create(:research)}

  context 'validates' do
    it { expect(research.name).to be_kind_of(String)}

    it { expect(research).to be_valid }

  end

  context 'has associations' do
    it { expect(research.companies).not_to be(nil)}

    it { expect(research.inquiries).not_to be(nil)}
  end

  context 'rsetricts' do

    it { expect(FactoryBot.build(:research, name: '')).not_to be_valid}

    it 'has unique name' do
      expect{FactoryBot.create(:research, name: research.name)}.to raise_error
    end
  end  
end
