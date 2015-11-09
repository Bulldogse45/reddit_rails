class Link < ActiveRecord::Base

  validates_presence_of :title, :user_id, :location

  belongs_to :user
  has_many :votes
  belongs_to :subcategory

end
