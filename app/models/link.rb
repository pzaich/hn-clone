class Link < ActiveRecord::Base
  attr_accessible :url, :title

  before_validation { |link| link.url = check_for_http(self.url.downcase) }

  validates_presence_of :title, :url
  validates_uniqueness_of :url
  validates_format_of :url, :with => /^http\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/

	def check_for_http(url)
		url.prepend('http://') if (/(^http:\/\/|^https:\/\/)/ =~ url).nil?
	end

end
