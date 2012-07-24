class RemoveTableKarmas < ActiveRecord::Migration
  def up
    drop_table :karmas
  end

  def down
  end
end
