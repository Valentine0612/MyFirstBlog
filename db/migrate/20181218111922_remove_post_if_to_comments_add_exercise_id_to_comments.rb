class RemovePostIfToCommentsAddExerciseIdToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :post_id
    add_column :comments, :exercise_id, :integer
  end
end
