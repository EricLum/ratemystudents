class Teacher < ApplicationRecord
  has_many :comments
  has_many :students, through: :comments
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
