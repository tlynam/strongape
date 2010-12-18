require 'test_helper'

class ExerciseGroupsControllerTest < ActionController::TestCase
  setup do
    @exercise_group = exercise_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_group" do
    assert_difference('ExerciseGroup.count') do
      post :create, :exercise_group => @exercise_group.attributes
    end

    assert_redirected_to exercise_group_path(assigns(:exercise_group))
  end

  test "should show exercise_group" do
    get :show, :id => @exercise_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @exercise_group.to_param
    assert_response :success
  end

  test "should update exercise_group" do
    put :update, :id => @exercise_group.to_param, :exercise_group => @exercise_group.attributes
    assert_redirected_to exercise_group_path(assigns(:exercise_group))
  end

  test "should destroy exercise_group" do
    assert_difference('ExerciseGroup.count', -1) do
      delete :destroy, :id => @exercise_group.to_param
    end

    assert_redirected_to exercise_groups_path
  end
end
