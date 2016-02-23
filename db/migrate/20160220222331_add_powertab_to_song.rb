class AddPowertabToSong < ActiveRecord::Migration
  def change
    add_column :songs, :powertab, :string
  end
end
