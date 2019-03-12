class ChangeVoteDefaultInVoteTable < ActiveRecord::Migration[5.2]
  def change
    change_column_default :vote_tables, :vote, from: nil, to: 0
  end
end
