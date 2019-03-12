class ChangeRatingDefaultInExercises < ActiveRecord::Migration[5.2]
  def change
    change_column_default :exercises, :rating, from: nil, to: 0
  end
end
