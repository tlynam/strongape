require 'test_helper'

class MetricDatasControllerTest < ActionController::TestCase
  setup do
    @metric_data = metric_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metric_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metric_data" do
    assert_difference('MetricData.count') do
      post :create, :metric_data => @metric_data.attributes
    end

    assert_redirected_to metric_data_path(assigns(:metric_data))
  end

  test "should show metric_data" do
    get :show, :id => @metric_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @metric_data.to_param
    assert_response :success
  end

  test "should update metric_data" do
    put :update, :id => @metric_data.to_param, :metric_data => @metric_data.attributes
    assert_redirected_to metric_data_path(assigns(:metric_data))
  end

  test "should destroy metric_data" do
    assert_difference('MetricData.count', -1) do
      delete :destroy, :id => @metric_data.to_param
    end

    assert_redirected_to metric_datas_path
  end
end
