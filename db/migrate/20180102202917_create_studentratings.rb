class CreateStudentratings < ActiveRecord::Migration[5.1]
  def change
    create_table :studentratings do |t|

      t.timestamps
    end
  end
end
