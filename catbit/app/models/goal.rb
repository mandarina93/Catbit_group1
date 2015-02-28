class Goal < ActiveRecord::Base
	belongs_to :profiles
	belongs_to :time_frames
end
