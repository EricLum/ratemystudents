class AddAuthorToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :author, :string
  end
end
