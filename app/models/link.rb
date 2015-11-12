class Link < ActiveRecord::Base

  validates_presence_of :title, :user_id, :location


  self.per_page =10

  belongs_to :user
  has_many :votes
  belongs_to :subcategory
  has_many :comments
  has_many :tags, through: :taggings
  has_many :taggings

  def confirm_web_address
    unless self.location[/\Ahttp:\/\//] || self.location[/\Ahttps:\/\//]||self.location == ""
    self.location = "http://"+self.location
    end
  end

  def tag_names=(tags)
    tags.split(",").collect{|t| t.strip}.each do |tag|
      this_tag = Tag.find_or_create_by(name: Tag.clean_name(tag))
      self.tags << this_tag
    end
  end

  def tag_names
    self.tags.collect{|t| t.name}.join(", ")
  end


end
