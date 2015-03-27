class Step < ActiveRecord::Base
	belongs_to :user
	
	def self.step_data(data, user)
	
      where(user_id: user, stepDate: Date.today).first_or_create do |step|
        step.stepAmount = data["steps"]
		step.stepDate = Date.today
	  end
	end
	
end
