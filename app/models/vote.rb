class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id, :value

  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  
  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type]
  validates_inclusion_of :value, :in => [1, -1]
  before_save :not_the_author
  
  def not_the_author
    self.voteable.user_id != self.user_id
  end
end
