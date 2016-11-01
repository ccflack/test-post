class AddPostRefToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :post, foreign_key: true
  end
end
