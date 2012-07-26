class Link < ActiveRecord::Base
  attr_accessible :url, :title
  belongs_to :user
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable

  before_validation { |link| link.url = check_for_http(self.url.downcase) }

  validates_presence_of :title, :url
  validates_uniqueness_of :url
  validates_format_of :url, :with => /(^http:\/\/|^https:\/\/)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/

	def check_for_http(url)
	  (/(^http:\/\/|^https:\/\/)/ =~ url).nil? ? url = 'http://' + url : url
	end

  def total_votes
    Vote.sum(:value)
  end
  
  def self.by_votes
    select('links.*, coalesce(value, 0) as votes').
    joins('left join voteables on link_id=links.id').
    order('votes desc')
  end

end
