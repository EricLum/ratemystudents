class CreateStudentRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :student_ratings do |t|
      t.integer :student_id
      t.integer :rating_id
      t.timestamps
    end
  end
end
