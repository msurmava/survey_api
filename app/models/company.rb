class Company < ApplicationRecord
  has_many :employments, dependent: :destroy
  has_many :users, through: :employments
  validates :name, uniqueness: true, presence: true
end
