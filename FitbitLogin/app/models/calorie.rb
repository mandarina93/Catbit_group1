class Calorie < ActiveRecord::Base
	belongs_to :user
	
	def self.calorie_data(data, user)
      where(user_id: user, calorieDate: Date.today).first_or_create do |calorie|
        calorie.calorieOut = data["caloriesOut"]
		calorie.calorieDate = Date.today
	  end
	end
	
	def self.refresh(user, client)
	  Calorie.where(user_id: user).find_each do |x|
		info = client.activities_on_date(x.calorieDate)
		x.update_attribute(:calorieOut, info["summary"]["caloriesOut"])
	  end
	end
end
