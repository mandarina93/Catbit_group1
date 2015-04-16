require 'test_helper'

class DistancesControllerTest < ActionController::TestCase
   test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:distances)
  end

  test "should update distance" do
    patch :update, id: @distance, distance: { distanceAmount: @distance.distanceAmount, distanceDate: @distance.distanceDate }
    assert_redirected_to distance_path(assigns(:distance))
  end

end
