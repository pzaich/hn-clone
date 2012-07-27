class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :links
  has_many :votes
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :karma_points, :username, :role
  validates_presence_of :username
  validates_uniqueness_of :username
  
  ROLES = %w[admin user banned hell_banned]
  
  # attr_accessible :title, :body
end
