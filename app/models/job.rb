class Job < ActiveRecord::Base
	validates_presence_of :title, :company, :location, :description

end
