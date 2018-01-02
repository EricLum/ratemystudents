class Rating < ApplicationRecord
  has_many :student_ratings
  has_many :students, through: :student_ratings
end
