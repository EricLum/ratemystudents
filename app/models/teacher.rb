class Teacher < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :students, through: :comments, dependent: :destroy
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
