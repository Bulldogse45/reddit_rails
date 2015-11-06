class Link < ActiveRecord::Base

  belongs_to :author
  has_many :votes
  
end
