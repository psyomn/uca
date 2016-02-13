class AddIndexesToBandsOffensesRatingsSongs < ActiveRecord::Migration
  def change
    add_index :bands, :user_id
    add_index :offenses, :user_id
    add_index :ratings, :song_id
    add_index :ratings, :user_id
    add_index :songs, :user_id
    add_index :songs, :band_id
  end
end
