class Responder < ApplicationRecord
  has_many :answerresponders
  has_many :answers, through: :answerresponders
  validates :code, presence: true, uniqueness: true
end
