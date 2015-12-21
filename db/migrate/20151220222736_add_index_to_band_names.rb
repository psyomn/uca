class AddIndexToBandNames < ActiveRecord::Migration
  def change
    add_index :bands, :name
  end
end
