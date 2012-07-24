class AddColumnKarmaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_id, :integer
  end
end
