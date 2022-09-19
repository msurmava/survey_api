require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:option) {FactoryBot.create(:option)}
  let(:option_correct) {FactoryBot.create(:option, corrrect: true)}

  context 'body' do
    it{expect(option.body).not_to be(nil)}

    it{expect(FactoryBot.build(:option, body: nil)).not_to be_valid}

    it{expect{FactoryBot.create(:option, body: nil)}.to raise_error}

    it "is unique per question" do
      expect(FactoryBot.build(:option, body: option.body, question:option.question)).not_to be_valid
    end
  end

  context 'belongs to question' do
    it{expect(option.question).to be_valid}

    it{expect(option.question).not_to be(nil)}
  end

  context 'at least one option is correct per question' do
    question = FactoryBot.create(:question, optional:true)
    option1 = FactoryBot.create(:option, question: question)
    option2 = FactoryBot.create(:option, question: question)
    option3 = FactoryBot.create(:option, question: question)

    it "can't create 4 wrong options" do
      expect{FactoryBot.create(:option, question: question)}.to raise_error
    end
  end

  context 'limited quantity per question' do
    question = FactoryBot.create(:question, optional:true)
    option1 = FactoryBot.create(:option, question: question)
    option2 = FactoryBot.create(:option, question: question)
    option3 = FactoryBot.create(:option, question: question)
    option4 = FactoryBot.create(:option, question: question, correct: true)

    it "fifth option not allowed" do
      expect{FactoryBot.create(:option, question: question)}.to raise_error
    end
  end

  context 'only one correct per question' do
    question = FactoryBot.create(:question, optional:true)
    option1 = FactoryBot.create(:option, question: question, correct: true)

    it 'raises error if second correct option is added' do
      expect{FactoryBot.create(:option, question: question, correct: true)}.to raise_error
    end
  end
end
