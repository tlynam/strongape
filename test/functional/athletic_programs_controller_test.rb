require 'test_helper'

class AthleticProgramsControllerTest < ActionController::TestCase
  setup do
    @athletic_program = athletic_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:athletic_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athletic_program" do
    assert_difference('AthleticProgram.count') do
      post :create, :athletic_program => @athletic_program.attributes
    end

    assert_redirected_to athletic_program_path(assigns(:athletic_program))
  end

  test "should show athletic_program" do
    get :show, :id => @athletic_program.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @athletic_program.to_param
    assert_response :success
  end

  test "should update athletic_program" do
    put :update, :id => @athletic_program.to_param, :athletic_program => @athletic_program.attributes
    assert_redirected_to athletic_program_path(assigns(:athletic_program))
  end

  test "should destroy athletic_program" do
    assert_difference('AthleticProgram.count', -1) do
      delete :destroy, :id => @athletic_program.to_param
    end

    assert_redirected_to athletic_programs_path
  end
end
