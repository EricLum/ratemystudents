class StudentRating < ApplicationRecord
  belongs_to :student
  belongs_to :rating
end
