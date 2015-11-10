class Vote < ActiveRecord::Base

  validates_presence_of :link_id
  validates :link_id, uniqueness: {scope: :user_id, message:"You can only vote once!"}

  before_validation :confirm_web_address


  def confirm_web_address
    unless self.link.location[/\Ahttp:\/\//] || self.link.location[/\Ahttps:\/\//]
    self.link.location = "http://"+self.link.location
    end
  end

  belongs_to :link
  belongs_to :user

end
