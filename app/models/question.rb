class Question < ApplicationRecord
  belongs_to :inquiry
  has_many :options
  has_many :answers, dependent: :destroy
  validates :body, uniqueness: { scope: :inquiry_id }
  validates :body, presence: true
  has_many :responders, through: :answers
end
