require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) {FactoryBot.create(:inquiry)}

  context 'name' do
    it { expect(FactoryBot.build(:inquiry, name: '')).not_to be_valid}

    it { expect(FactoryBot.build(:inquiry, name: inquiry.name)).not_to be_valid}

    it 'raise error if not unique' do
      expect{FactoryBot.create(:inquiry, name: inquiry.name)}.to raise_error
    end
  end

  context "has associations" do
    it { expect(inquiry.questions).not_to be(nil)}

    it { expect(inquiry.research).not_to be(nil)}

    it "doesn't belong to many researches" do
      expect{inquiry.researches}.to raise_error(NoMethodError)
    end

    it "belongs to one research" do
      expect{inquiry.research}.not_to raise_error(NoMethodError)
    end
  end

end
