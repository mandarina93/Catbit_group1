class CaloriesController < ApplicationController
  before_action :set_calories, only: [:show, :edit, :update, :destroy]

  # GET /calories
  # GET /calories.json
  def index
        client = user_client
	#todays information
	user = current_user.id
	user_activities = client.activities_on_date 'today'
	calorie = Calorie.calorie_data(user_activities["summary"], user)
	Calorie.refresh(user, client)
	
        @name = current_user.name
        @caloriesDaily = calorie.calorieOut
        @caloriesHistory = Calorie.where(user_id: user).order(calorieDate: :desc)
	data = Calorie.goal_data(user)
	@calorieGoal = data["goalAmount"].to_f
  end

  # GET /calories/1
  # GET /calories/1.json
  def show
  end

  # GET /calories/new
  def new
    @calories = Calory.new
  end

  # GET /calories/1/edit
  def edit
  end

  # POST /calories
  # POST /calories.json
  def create
    @calories = Calory.new(calories_params)

    respond_to do |format|
      if @calories.save
        format.html { redirect_to @calories, notice: 'Calory was successfully created.' }
        format.json { render :show, status: :created, location: @calories }
      else
        format.html { render :new }
        format.json { render json: @calories.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calories/1
  # PATCH/PUT /calories/1.json
  def update
    respond_to do |format|
      if @calories.update(calories_params)
        format.html { redirect_to @calories, notice: 'Calory was successfully updated.' }
        format.json { render :show, status: :ok, location: @calories }
      else
        format.html { render :edit }
        format.json { render json: @calories.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calories/1
  # DELETE /calories/1.json
  def destroy
    @calories.destroy
    respond_to do |format|
      format.html { redirect_to calories_url, notice: 'Calory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calories
      @calories = Calory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calories_params
      params.require(:calories).permit(:calorieDate, :calorieIn, :calorieOut)
    end
end
