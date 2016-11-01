class AddEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_address, :string
  end
end
