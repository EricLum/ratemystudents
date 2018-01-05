class Student < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :teachers, through: :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def self.highest_gpa_student
       hash = {}
       Rating.all.map do |rating|
          hash[rating.student.name] = rating.gpa
       end
       a=hash.sort_by {|_key, value| value}.last
       "#{a[0]} with a GPA of #{a[1]}!"
   end

   def self.average_gpa
     Rating.average(:gpa)
   end

   def self.average_discipline
     Rating.average(:discipline)
   end

   def self.lowest_gpa_student
     hash = {}
     Rating.all.map do |rating|
        hash[rating.student.name] = rating.gpa
     end
     a=hash.sort_by {|_key, value| value}.first
     "#{a[0]} with a GPA of #{a[1]}!"
   end

   def self.lowest_grit_student
     hash = {}
     Rating.all.map do |rating|
        hash[rating.student.name] = rating.grit
     end
     a=hash.sort_by {|_key, value| value}.first
     "#{a[0]} with an effort of #{a[1]}!"
   end

   def self.highest_grit_student
     hash = {}
     Rating.all.map do |rating|
        hash[rating.student.name] = rating.grit
     end
     a=hash.sort_by {|_key, value| value}.last
     "#{a[0]} with an effort of #{a[1]}!"
   end

   def best_subject
     self.ratings.order(:gpa).last.subject
   end

   def worst_subject
     self.ratings.order(:gpa).first.subject
   end

   def comment_count
     self.comments.count
   end

   def ratings_count
     self.ratings.count
   end

   def like_count
     #count the number of likes of each comment concerning the student
     self.comments.inject(0){|sum,com| sum + com.likes.count}
   end

   def self.student_with_most_likes
     hash = {}
     Student.all.map do |student|
        hash[student.name] = student.like_count
     end
     a=hash.sort_by {|_key, value| value}.last
     "#{a[0]} with #{a[1]} likes!"
   end

end
