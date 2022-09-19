require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) {FactoryBot.create(:answer)}

  context 'associations' do
    context 'to question' do
      it "should belong to" do
        subject { described_class.new }
        assc = described_class.reflect_on_association(:question)
        expect(assc.macro).to eq :belongs_to
      end
  
      it{ expect(answer).to be_valid}
  
      it{ expect(answer.question).not_to be(nil)}
    end
    
    context 'to responders' do
      it "should have many" do
        subject { described_class.new }
        assc = described_class.reflect_on_association(:responders)
        expect(assc.macro).to eq :has_many
      end
  
      it { expect(answer.responders).not_to be(nil)}
    end
  end


  context 'for optional question' do
    optional_question = FactoryBot.create(:question, optional: true)
    another_optional_question = FactoryBot.create(:question, optional: true)
    option = FactoryBot.create(:option, question: optional_question)
     it "doesn't allow without option_id" do
       expect{FactoryBot.create(:answer, question: optional_question)}.to raise_error
     end

     it "allows option" do
      expect{FactoryBot.create(:answer, question: optional_question, option_id: option.id)}.not_to raise_error
     end

     it "only allows options from specific question" do
      expect{FactoryBot.create(:answer, question: another_optional_question, option_id: option.id)}.to raise_error
     end

     it { expect(FactoryBot.create(:answer, question: optional_question, option_id: option.id, text: nil)).to be_valid}
   end

  context 'for non optional question' do
    it { expect(answer.text).not_to be('nil')}

    it { expect(FactoryBot.build(:answer, text: nil)).not_to be_valid}

    it { expect{FactoryBot.create(:answer, text: nil)}.to raise_error}

    it "can be valid with nil option id" do
      expect(FactoryBot.create(:answer, option_id: nil))
    end
  end
end
