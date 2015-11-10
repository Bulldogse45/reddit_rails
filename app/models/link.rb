class Link < ActiveRecord::Base

  validates_presence_of :title, :user_id, :location

  self.per_page =10

  belongs_to :user
  has_many :votes
  belongs_to :subcategory

end
