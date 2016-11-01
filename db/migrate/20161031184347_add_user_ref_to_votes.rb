class AddUserRefToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :user, foreign_key: true
    remove_column :votes, :vote_count
  end
end
