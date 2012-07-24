class AddColumnKarmaPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_points, :integer, :null => false, :default => 0
  end
end
