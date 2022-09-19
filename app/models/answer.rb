class Answer < ApplicationRecord
  belongs_to :question
  has_many :answerresponders, dependent: :destroy
  has_many :responders, through: :answerresponders
  validate :optional_question_has_option_as_answer
  validate :non_optional_question_has_text_as_answer
  validate :option_only_answers_its_question

  protected

  def optional_question_has_option_as_answer
    get_question
    errors.add(:empty_field, 'please choose an option') if @question.optional == true && option_id.nil?
  end

  def non_optional_question_has_text_as_answer
    get_question
    errors.add(:empty_field, 'please fill the answer field') if @question.optional == false && text.nil?
  end

  def option_only_answers_its_question
    get_question
    errors.add(:option, 'wrong option') if @question.optional == true && !@question.options.collect(&:id).include?(option_id)
  end
  private

  def get_question
    @question = Question.find(question_id)
  end
end
