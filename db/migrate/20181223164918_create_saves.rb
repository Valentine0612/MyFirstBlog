class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.integer :user_id, null: false
      t.integer :exercise_id, null: false

      t.timestamps
    end
  end
end
