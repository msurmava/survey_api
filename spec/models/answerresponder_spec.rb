require 'rails_helper'

RSpec.describe Answerresponder, type: :model do
  let(:answerresponders) { FactoryBot.create(:answerresponders)}

  context "assiciations" do
    subject { described_class.new }

    it "should belong to answers" do
      assc = described_class.reflect_on_association(:answer)
      expect(assc.macro).to eq :belongs_to
    end

    it "should belong to responders" do
      assc = described_class.reflect_on_association(:responder)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
