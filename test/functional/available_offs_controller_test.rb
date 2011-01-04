require 'test_helper'

class AvailableOffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:available_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create available_off" do
    assert_difference('AvailableOff.count') do
      post :create, :available_off => { }
    end

    assert_redirected_to available_off_path(assigns(:available_off))
  end

  test "should show available_off" do
    get :show, :id => available_offs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => available_offs(:one).to_param
    assert_response :success
  end

  test "should update available_off" do
    put :update, :id => available_offs(:one).to_param, :available_off => { }
    assert_redirected_to available_off_path(assigns(:available_off))
  end

  test "should destroy available_off" do
    assert_difference('AvailableOff.count', -1) do
      delete :destroy, :id => available_offs(:one).to_param
    end

    assert_redirected_to available_offs_path
  end
end
