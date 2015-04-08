class DashboardController < ApplicationController
  def index
	client = user_client
	#todays information
	user_activities = client.activities_on_date 'today'
	step = Step.step_data(user_activities["summary"], current_user.id)
	distance = Distance.distance_data(user_activities["summary"], current_user.id)
	calorie = Calorie.calorie_data(user_activities["summary"], current_user.id)
	
	@name = current_user.name
	@stepToday = step.stepAmount
	@distanceToday = distance.distanceAmount
	@calorieToday = calorie.calorieOut
  end
end
