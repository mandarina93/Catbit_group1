class Goal < ActiveRecord::Base
	belongs_to :user
	
	def self.goal_data(data, user)
      where(user_id: user, goalName: data["goalName"]).first_or_create do |goal|
        goal.timeFrame = data["timeFrame"]
		goal.goalAmount = data["goalAmount"]
	  end
	end
end
