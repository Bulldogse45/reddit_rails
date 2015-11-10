class User < ActiveRecord::Base

  acts_as_authentic

  validates_presence_of :username, :name, :aboutme

  has_many :links
  has_many :votes

end
