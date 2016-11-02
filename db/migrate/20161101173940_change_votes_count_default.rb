class ChangeVotesCountDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :votes_count, 0)
  end
end
