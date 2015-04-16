require 'test_helper'

class CaloriesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calories)
  end

  test "should update calories" do
    patch :update, id: @calories, calories: { calorieDate: @calories.calorieDate, calorieIn: @calories.calorieIn, calorieOut: @calories.calorieOut }
    assert_redirected_to calories_path(assigns(:calories))
  end

end
