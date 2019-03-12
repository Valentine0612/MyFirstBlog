class CreateExercisesUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :exercises, :users do |t|
      t.index :exercise_id
      t.index :user_id
    end
  end
end
