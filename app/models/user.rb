class User < ApplicationRecord
  has_many :employments, dependent: :destroy
  has_many :companies, through: :employments
  validates :email, uniqueness: true, presence: true
  has_secure_password
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
