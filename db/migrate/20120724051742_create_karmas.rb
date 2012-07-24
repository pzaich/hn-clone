class CreateKarmas < ActiveRecord::Migration
  def change
    create_table :karmas do |t|
      t.integer :user_id
      t.float :total, :null => false, :default => 0

      t.timestamps
    end
  end
end
