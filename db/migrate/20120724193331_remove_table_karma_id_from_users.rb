class RemoveTableKarmaIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :karma_id
  end

  def down
  end
end
