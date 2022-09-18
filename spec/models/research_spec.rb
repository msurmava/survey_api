require 'rails_helper'

RSpec.describe Research, type: :model do
  let(:research) {FactoryBot.build(:research)}

  context 'validates' do
    it { expect(research.name).to be_kind_of(String)}

    it { expect(research).to be_valid }

    it { expect(research.companies).not_to be(nil)}
  end
end
