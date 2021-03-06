require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: { goalAmount: @goal.goalAmount, goalName: @goal.goalName, timeFrame: @goal.timeFrame }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: { goalAmount: @goal.goalAmount, goalName: @goal.goalName, timeFrame: @goal.timeFrame }
    assert_redirected_to goal_path(assigns(:goal))
  end
end
