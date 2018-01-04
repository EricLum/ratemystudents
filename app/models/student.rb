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
     "#{a[0]} with a grit of #{a[1]}!"
   end

   def self.highest_grit_student
     hash = {}
     Rating.all.map do |rating|
        hash[rating.student.name] = rating.grit
     end
     a=hash.sort_by {|_key, value| value}.last
     "#{a[0]} with a grit of #{a[1]}!"
   end

   def self.student_of_the_day
     self.all.sample.name
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



end
