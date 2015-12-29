class CreateOffenses < ActiveRecord::Migration
  def change
    create_table :offenses do |t|
      t.integer :user_id
      t.string :offense_type
      t.text :message
      t.string :attempted_resource

      t.timestamps null: false
    end
  end
end
