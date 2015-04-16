class Calorie < ActiveRecord::Base
	belongs_to :user
	validates :calorieDate, presence: true
	
	def self.calorie_data(data, user)
      where(user_id: user, calorieDate: Date.today).first_or_create do |calorie|
        calorie.calorieOut = data["caloriesOut"]
		calorie.calorieDate = Date.today
	  end
	end
	
	def self.refresh(user, client)
	  Calorie.where(user_id: user).find_each do |x|
		info = client.activities_on_date(x.calorieDate)
		if(x.calorieDate != Date.today)
			x.update_attribute(:calorieOut, info["summary"]["caloriesOut"])
		end
	  end
	end
	
	def self.goal_data(user)
		if (Goal.where(user_id: user, goalName: 1).blank?)
			data = {"goalAmount" => 2000}
		else
			data = Goal.where(user_id: user, goalName: 1).take!
		end
	end
end
