class Entry < ActiveRecord::Base
	# use uuid as primary key
	include Extensions::UUID

	attr_accessible :content
end
