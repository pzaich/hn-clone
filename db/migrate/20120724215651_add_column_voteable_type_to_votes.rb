class AddColumnVoteableTypeToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voteable_type, :string
  end
end
