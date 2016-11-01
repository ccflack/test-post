class FixingColumns < ActiveRecord::Migration[5.0]
  def change
    remove_reference :votes, :user
  end
end
