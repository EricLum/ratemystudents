class Comment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  has_many :likes
  has_many :liking_teachers, through: :likes, source: :teacher

  def self.comment_count
      self.all.count
  end
end
