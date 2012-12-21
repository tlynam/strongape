require 'test_helper'

class WorkoutLogsControllerTest < ActionController::TestCase
  setup do
    @workout_log = workout_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_log" do
    assert_difference('WorkoutLog.count') do
      post :create, workout_log: { date: @workout_log.date, exercise: @workout_log.exercise }
    end

    assert_redirected_to workout_log_path(assigns(:workout_log))
  end

  test "should show workout_log" do
    get :show, id: @workout_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workout_log
    assert_response :success
  end

  test "should update workout_log" do
    put :update, id: @workout_log, workout_log: { date: @workout_log.date, exercise: @workout_log.exercise }
    assert_redirected_to workout_log_path(assigns(:workout_log))
  end

  test "should destroy workout_log" do
    assert_difference('WorkoutLog.count', -1) do
      delete :destroy, id: @workout_log
    end

    assert_redirected_to workout_logs_path
  end
end
