class AddUserIdToNewsitem < ActiveRecord::Migration
  def change
    add_column :newsitems, :user_id, :integer
    add_index :newsitems, :user_id
  end
end
