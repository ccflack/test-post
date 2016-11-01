class AddVoteRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :reference, :posts
  end
end
