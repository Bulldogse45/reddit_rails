class Comment < ActiveRecord::Base

  validates_presence_of :user

  belongs_to :user
  belongs_to :comment
  belongs_to :link
  has_many :comments

end
