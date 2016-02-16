class CreateSubmissionComments < ActiveRecord::Migration
  def change
    create_table :submission_comments do |t|
      t.integer :submission_id
      t.string :comment
      t.integer :user_id
      t.integer :vote_type

      t.timestamps null: false
    end

    add_index :submission_comments, :user_id
  end
end
