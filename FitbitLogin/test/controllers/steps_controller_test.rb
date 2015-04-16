require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steps)
  end

  test "should update step" do
    patch :update, id: @step, step: { stepAmount: @step.stepAmount, stepDate: @step.stepDate }
    assert_redirected_to step_path(assigns(:step))
  end

end
