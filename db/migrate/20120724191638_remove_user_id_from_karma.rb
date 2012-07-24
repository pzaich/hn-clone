class RemoveUserIdFromKarma < ActiveRecord::Migration
  def up
    remove_column :karmas, :user_id
  end

  def down
    add_column :karmas, :user_id, :integer
  end
end
