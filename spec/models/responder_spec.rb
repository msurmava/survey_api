require 'rails_helper'

RSpec.describe Responder, type: :model do
  let(:responder) {FactoryBot.create(:responder)}
  context "code" do

    it "if not unique" do
      expect{FactoryBot.create(:responder, code: responder.code)}.to raise_error
    end

    it { expect(responder.code).not_to be(nil)}

    it { expect(responder.code.length).to eq(7)}

  end

  context "has answers" do
    it { expect(responder.answers).not_to be(nil)}
  end

  context 'associations' do
    it "should have many answers" do
      subject { described_class.new }
      assc = described_class.reflect_on_association(:answers)
      expect(assc.macro).to eq :has_many
    end
  end
end
