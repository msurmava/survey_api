class Research < ApplicationRecord
  has_many :researchcompanies
  has_many :companies, through: :researchcompanies
  validates :name, uniqueness: true, presence: true

end
