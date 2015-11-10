class Subcategory < ActiveRecord::Base

  validates_presence_of :name, :user_id

  has_many :links
  belongs_to :user
end
