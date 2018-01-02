class Rating < ApplicationRecord
  has_many :student_ratings
  has_many :students, through: :student_ratings
  validates :gpa, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :discipline, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :grit, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
end
