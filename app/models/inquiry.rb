class Inquiry < ApplicationRecord
  belongs_to :research
  validates :name, uniqueness: true, presence: true
end
