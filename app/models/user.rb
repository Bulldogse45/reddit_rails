class User < ActiveRecord::Base

  validates_presence_of :username, :name, :aboutme

  has_many :links
  has_many :votes

end
