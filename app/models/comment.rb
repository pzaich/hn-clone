class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :reply, :user_id
end
