class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id

  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  

end
