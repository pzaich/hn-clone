class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id, :value

  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  
  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type]
  validates_inclusion_of :value, :in => [1, -1]
  before_save :not_author?
  after_save :change_karma_voteable_author
  
  def not_author?
    self.voteable.user_id != self.user_id
  end

  def change_karma_voteable_author
  	self.value == 1 ? give_karma : remove_karma
  end

  def remove_karma
    if self.user.karma_points > 99 
  	 self.voteable.user.decrement!(:karma_points) unless self.voteable.user.karma_points == 0
    end
  end

  def give_karma
  	self.voteable.user.increment!(:karma_points)
  end
end
