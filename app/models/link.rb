class Link < ActiveRecord::Base
  attr_accessible :entry_id, :uri

  belongs_to :entry
end
