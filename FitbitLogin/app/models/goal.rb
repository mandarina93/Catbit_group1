class Goal < ActiveRecord::Base
	belongs_to :user
	
	def self.goal_data(data, user)
      where(user_id: user, goalName: data["goalName"]).first_or_create do |goal|
        goal.timeFrame = data["timeFrame"]
		goal.goalAmount = data["goalAmount"]
	  end
	end
	
	def self.get_goals(user)
		data = {}
		if (where(user_id: user, goalName: 0).blank?)
			data[:step] = 10000
		else 
			info = where(user_id: user, goalName: 0).take!
			data[:step] = info.goalAmount
		end
		if (where(user_id: user, goalName: 1).blank?)
			data[:calorie] = 2000
		else
			info = where(user_id: user, goalName: 1).take!
			data[:calorie] = info.goalAmount
		end
		if (where(user_id: user, goalName: 2).blank?)
			data[:distance] = 3
		else
			info = where(user_id: user, goalName: 2).take!
			data[:distance] = info.goalAmount
		end
		data
	end
	
	def self.get_times(user)
		data = {}
		if (where(user_id: user, goalName: 0).blank?)
			data[:step] = "Daily"
		else 
			info = where(user_id: user, goalName: 0).take!
			if(info.timeFrame == 0)
				data[:step] = "Daily"
			elsif (info.timeFrame == 1)
				data[:step] = "Weekly"
			else
				data[:step] = "Monthly"
			end
		end
		if (where(user_id: user, goalName: 1).blank?)
			data[:calorie] = "Daily"
		else
			info = where(user_id: user, goalName: 1).take!
			if(info.timeFrame == 0)
				data[:calorie] = "Daily"
			elsif (info.timeFrame == 1)
				data[:calorie] = "Weekly"
			else
				data[:calorie] = "Monthly"
			end
		end
		if (where(user_id: user, goalName: 2).blank?)
			data[:distance] = "Daily"
		else
			info = where(user_id: user, goalName: 2).take!
			if(info.timeFrame == 0)
				data[:distance] = "Daily"
			elsif (info.timeFrame == 1)
				data[:distance] = "Weekly"
			else
				data[:distance] = "Monthly"
			end
		end
		data
	end
end
