class AddValueToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :integer
    add_index :votes, :user_id
  end
end
