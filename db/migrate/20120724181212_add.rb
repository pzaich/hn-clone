class Add < ActiveRecord::Migration
  def up
    add_index :votes, :voteable_id
  end

  def down
  end
end
