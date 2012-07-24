class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.text :reply
      t.integer :user_ids

      t.timestamps
    end
  end
end
