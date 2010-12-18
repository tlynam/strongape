require 'test_helper'

class ProgramWeeksControllerTest < ActionController::TestCase
  setup do
    @program_week = program_weeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_week" do
    assert_difference('ProgramWeek.count') do
      post :create, :program_week => @program_week.attributes
    end

    assert_redirected_to program_week_path(assigns(:program_week))
  end

  test "should show program_week" do
    get :show, :id => @program_week.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @program_week.to_param
    assert_response :success
  end

  test "should update program_week" do
    put :update, :id => @program_week.to_param, :program_week => @program_week.attributes
    assert_redirected_to program_week_path(assigns(:program_week))
  end

  test "should destroy program_week" do
    assert_difference('ProgramWeek.count', -1) do
      delete :destroy, :id => @program_week.to_param
    end

    assert_redirected_to program_weeks_path
  end
end
