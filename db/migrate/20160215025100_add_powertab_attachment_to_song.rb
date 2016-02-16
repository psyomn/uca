class AddPowertabAttachmentToSong < ActiveRecord::Migration
  def up
    add_attachment :songs, :powertab
  end

  def down
    remove_attachment :songs, :powertab
  end
end
