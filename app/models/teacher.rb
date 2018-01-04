class Teacher < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :students, through: :comments, dependent: :destroy
  has_secure_password
  validates :username, presence: true, uniqueness: true

  def student_count
    "You currently have #{self.students.count} student(s)."
  end
end
