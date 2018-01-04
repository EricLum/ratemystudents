class Comment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  def self.comment_count
      self.all.count
  end
end
