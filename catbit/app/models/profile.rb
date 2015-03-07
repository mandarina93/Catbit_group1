class Profile < ActiveRecord::Base
	belongs_to :users
	has_many :goals
	belongs_to :themes
	has_many :steps
end
