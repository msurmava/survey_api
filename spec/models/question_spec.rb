require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {FactoryBot.create(:question)}
  let(:question_optional) {FactoryBot.create(:question, optional: true)}

  context 'body' do
    it {expect(question.body).not_to be(nil)}
    
    it {expect(question_optional.body).not_to be(nil)}

    it {expect(FactoryBot.build(:question, body: '')).not_to be_valid}

    it "is unique per inquiry" do
      expect(FactoryBot.build(:question, body: question.body, inquiry:question.inquiry)).not_to be_valid
    end
  end

  context 'with options' do
    it { expect(question.optional).to be(false) }

    it 'has many options' do
      expect(question.options).not_to be(nil)
    end
  end

  context 'without options' do
    it { expect(question_optional.optional).to be(true) }
  end

  context 'belongs to inquiry' do
    it 'not belongs to multiple inquiries' do
      expect{question.inquiries}.to raise_error(NoMethodError)
    end

    it{ expect(question.inquiry).not_to be(nil) }
  end
  
  context 'has many answers' do
    it{ expect(question.answers).not_to be(nil)}
  end

  context 'has many responders' do
    it {expect(question.responders).not_to be(nil)}
  end
end
