class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :reply, :user_id
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
end
