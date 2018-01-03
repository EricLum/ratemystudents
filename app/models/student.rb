class Student < ApplicationRecord
  has_many :comments
  has_many :student_ratings
  has_many :ratings, through: :student_ratings

  def highest_grade
    #highest gpa
  end

  def highest_grit

  end

  def lowest_grade

  end

  def lowest_grit

  end

end
