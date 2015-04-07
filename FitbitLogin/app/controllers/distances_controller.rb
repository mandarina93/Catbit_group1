class DistancesController < ApplicationController
  before_action :set_distance, only: [:show, :edit, :update, :destroy]

  # GET /distances
  # GET /distances.json
  def index
  @name = current_user.name
  @distanceDaily = "1.93 miles"
  @distanceHistory = Distance.all
  end

  # GET /distances/1
  # GET /distances/1.json
  def show
  end

  # GET /distances/new
  def new
    @distance = Distance.new
  end

  # GET /distances/1/edit
  def edit
  end

  # POST /distances
  # POST /distances.json
  def create
    @distance = Distance.new(distance_params)

    respond_to do |format|
      if @distance.save
        format.html { redirect_to @distance, notice: 'Distance was successfully created.' }
        format.json { render :show, status: :created, location: @distance }
      else
        format.html { render :new }
        format.json { render json: @distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distances/1
  # PATCH/PUT /distances/1.json
  def update
    respond_to do |format|
      if @distance.update(distance_params)
        format.html { redirect_to @distance, notice: 'Distance was successfully updated.' }
        format.json { render :show, status: :ok, location: @distance }
      else
        format.html { render :edit }
        format.json { render json: @distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distances/1
  # DELETE /distances/1.json
  def destroy
    @distance.destroy
    respond_to do |format|
      format.html { redirect_to distances_url, notice: 'Distance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distance
      @distance = Distance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distance_params
      params.require(:distance).permit(:distanceAmount, :distanceDate)
    end
end
