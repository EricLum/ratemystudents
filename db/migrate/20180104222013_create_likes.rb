class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :comment_id
      t.integer :teacher_id
      t.timestamps
    end
  end
end
