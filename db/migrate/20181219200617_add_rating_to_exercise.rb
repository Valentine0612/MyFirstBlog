class AddRatingToExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :rating, :integer
  end
end
