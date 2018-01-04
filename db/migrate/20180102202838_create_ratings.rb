class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :discipline
      t.string :learning_style
      t.integer :grit
      t.float :gpa
      t.string :subject
      t.integer :student_id 

      t.timestamps
    end
  end
end
