# this will create the model relations required
class AddModelRelations < ActiveRecord::Migration
  def change
    add_column :bands, :user_id, :integer

    add_column :songs, :user_id, :integer
    add_column :songs, :band_id, :integer

    add_column :ratings, :song_id, :integer
    add_column :ratings, :user_id, :integer
  end
end
