class Student < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :teachers, through: :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def lowest_grade

  end

  def highest_grit

  end

  def lowest_grit

  end

  def most_popular_learning_style

  end

  def highest_discipline

  end

  def lowest_discipline

  end

end
