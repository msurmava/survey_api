class Answerresponder < ApplicationRecord
  belongs_to :answer
  belongs_to :responder
  validate :responder_responds_once_per_question

  private

  def responder_responds_once_per_question
    question = Answer.where(:id => answer_id).first.question
    responders = question.responders
    responder = Responder.where(:id => responder_id)
    same_responder = responders.all do |re|
      return true if re.code = responder.first[0]
    end
    if !same_responder.empty?
      errors.add(:same_responder, 'you already responded to this quetsion')  
    end
  end
end
