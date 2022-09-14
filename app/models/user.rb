class User < ApplicationRecord
  has_many :employments, dependent: :destroy
  has_many :companies, through: :employments
  validates :email, uniqueness: true, presence: true
  has_secure_password
end
