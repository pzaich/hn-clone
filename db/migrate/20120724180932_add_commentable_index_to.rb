class AddCommentableIndexTo < ActiveRecord::Migration
  def up
    add_index :comments, :commentable_id
  end

  def down
  end
end
