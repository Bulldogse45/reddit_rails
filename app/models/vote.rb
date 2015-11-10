class Vote < ActiveRecord::Base

  validates_presence_of :link_id

  belongs_to :link
  belongs_to :user

end
