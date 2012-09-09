class Entry < ActiveRecord::Base
  attr_accessible :content

  has_many :links
end
