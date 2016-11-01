class FixReferences < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :vote
    add_reference :votes, :user, foreign_key: true
  end
end
