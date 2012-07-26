class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :reply, :user_id, :link_id
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  
  def total_votes
    Vote.sum(:value)
  end
  
  def self.by_votes
    select('comments.*, coalesce(value, 0) as votes').
    joins('left join voteables on comment_id=comments.id').
    order('votes desc')
  end
  
end
