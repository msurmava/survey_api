class Inquiry < ApplicationRecord
  belongs_to :research
  has_many :questions
  validates :name, uniqueness: true, presence: true
end
