class Student < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :student_ratings
  has_many :ratings, through: :student_ratings, dependent: :destroy

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
