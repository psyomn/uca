class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :song_id
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
