class Comment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  has_many :likes
  has_many :liking_teachers, through: :likes, source: :teacher

  def self.comment_count
      self.all.count
  end

  def like_count
    self.likes.count
  end

  def liking_teacher_names
    #returns array of the teachers names who liked the comment
    self.liking_teachers.collect do |teacher|
      teacher.username
    end
  end

end
