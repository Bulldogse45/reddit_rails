class Link < ActiveRecord::Base

  validates_presence_of :title, :user_id, :location

  self.per_page =10

  belongs_to :user
  has_many :votes
  belongs_to :subcategory

  def confirm_web_address
    unless self.location[/\Ahttp:\/\//] || self.location[/\Ahttps:\/\//]||self.location == ""
    self.location = "http://"+self.location
    end
  end

end
