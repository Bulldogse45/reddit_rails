class Subcategory < ActiveRecord::Base

  validates_presence_of :name

  has_many :links
end