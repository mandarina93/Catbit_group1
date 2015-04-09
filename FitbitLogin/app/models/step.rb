class Step < ActiveRecord::Base
	belongs_to :user
	
	def self.step_data(data, user)
      where(user_id: user, stepDate: Date.today).first_or_create do |step|
        step.stepAmount = data["steps"]
		step.stepDate = Date.today
	  end
	end
	
	def self.refresh(user, client)
	  Step.where(user_id: user).find_each do |x|
		info = client.activities_on_date(x.stepDate)
		x.update_attribute(:stepAmount, info["summary"]["steps"])
	  end
	end
	
	def self.goal_data(user)
		if (Goal.where(user_id: user, goalName: 0).blank?)
			data = {"goalAmount" => 10000}
		else
			data = Goal.where(user_id: user, goalName: 0).take!
		end
	end
end
