class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
