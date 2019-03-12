class CreateVoteTables < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_tables do |t|
      t.integer :user_id
      t.integer :vote
      t.integer :exercise_id

      t.timestamps
    end
  end
end
