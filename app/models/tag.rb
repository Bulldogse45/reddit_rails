class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :links, through: :tagging

  before_validation :downcase_name
                    :strip_spaces
                    :remove_symbols

  def remove_symbols
    self.name = self.name.gsub(/[^0-9a-z ]/i, '')
  end

  def downcase_name
    self.name = self.name.downcase
  end

  def strip_spaces
    self.name = self.name.strip
  end

  def self.clean_name(name)
    tag = Tag.new(name: name)
    tag.strip_spaces
    tag.downcase_name
    tag.remove_symbols
  end

end
