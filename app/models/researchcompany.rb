class Researchcompany < ApplicationRecord
  belongs_to :research
  belongs_to :company
  validates :company_id, uniqueness: { scope: :research_id }
end
