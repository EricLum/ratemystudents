class Rating < ApplicationRecord
  belongs_to :student, dependent: :destroy
  validates :gpa, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :discipline, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :grit, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

def self.highest_grade
  Rating.maximum(:gpa)
end

def self.lowest_grade
  Rating.minimum(:gpa)
end

def highest_grit
  Rating.maximum(:grit)
end

def lowest_grit
  Rating.minimum(:grit)
end

end
