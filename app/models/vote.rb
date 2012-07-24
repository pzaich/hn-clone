class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id
end
