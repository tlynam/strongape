require 'test_helper'

class DateOfWorkoutsControllerTest < ActionController::TestCase
  setup do
    @date_of_workout = date_of_workouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_of_workouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_of_workout" do
    assert_difference('DateOfWorkout.count') do
      post :create, :date_of_workout => @date_of_workout.attributes
    end

    assert_redirected_to date_of_workout_path(assigns(:date_of_workout))
  end

  test "should show date_of_workout" do
    get :show, :id => @date_of_workout.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @date_of_workout.to_param
    assert_response :success
  end

  test "should update date_of_workout" do
    put :update, :id => @date_of_workout.to_param, :date_of_workout => @date_of_workout.attributes
    assert_redirected_to date_of_workout_path(assigns(:date_of_workout))
  end

  test "should destroy date_of_workout" do
    assert_difference('DateOfWorkout.count', -1) do
      delete :destroy, :id => @date_of_workout.to_param
    end

    assert_redirected_to date_of_workouts_path
  end
end
