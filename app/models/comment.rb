class Comment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  accepts_nested_attributes_for :student
end
