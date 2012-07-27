class AddVisibleToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visible, :string, :default => "visible", :null => false
    add_index :links, :visible
  end
end
