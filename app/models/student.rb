class Student < ApplicationRecord
  has_many :comments
  has_many :student_ratings
  has_many :ratings, through: :student_ratings
end
