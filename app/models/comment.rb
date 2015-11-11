class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :comment
  belongs_to :link
  has_many :comments

end
