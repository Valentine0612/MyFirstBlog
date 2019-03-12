class SetRatingOnZeroInExercises < ActiveRecord::Migration[5.2]
  def change
    Exercise.update_all rating: 0
  end
end
