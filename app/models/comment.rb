class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :reply, :user_id
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  
  def find_parent_link
    if self.commentable_type == "Comment"
      Comment.find(commentable_id).find_parent_link
    else
      @link_id_num = commentable_id
    end
  end
  
  def total_votes
    Vote.sum(:value)
  end
  
  def self.by_votes
    select('comments.*, coalesce(value, 0) as votes').
    joins('left join voteables on comment_id=comments.id').
    order('votes desc')
  end
  
end
