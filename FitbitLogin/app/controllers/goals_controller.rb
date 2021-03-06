class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @name = current_user.name
	user = current_user.id
	
	goalInfo = Goal.get_goals(user)
	@stepGoal = goalInfo[:step]
	@calorieGoal = goalInfo[:calorie]
	@distanceGoal = goalInfo[:distance]
	
	timeInfo = Goal.get_times(user)
	@stepTime = timeInfo[:step]
	@calorieTime = timeInfo[:calorie]
	@distanceTime = timeInfo[:distance]
	
    @goal = Goal.new
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
	user_id = current_user.id
    @name = current_user.name
	if(@goal.goalName == 0)
		@goalType = "Steps"
	elsif (@goal.goalName == 1)
		@goalType = "Calories"
	else
		@goalType = "Miles"
	end
	if(@goal.timeFrame == 0)
		@time = "Daily"
	elsif (@goal.timeFrame == 1)
		@time = "Weekly"
	else
		@time = "Monthly"
	end
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.goal_data(goal_params, current_user.id)
	@goal.update(goal_params)
    redirect_to @goal, notice: 'Goal was successfully updated.'
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:goalName, :timeFrame, :goalAmount)
    end
end
