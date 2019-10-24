class Comment < ActiveRecord::Base
	belongs_to :story, class_name: "Story"
end