require 'test_helper'

class AppliedOffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applied_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create applied_off" do
    assert_difference('AppliedOff.count') do
      post :create, :applied_off => { }
    end

    assert_redirected_to applied_off_path(assigns(:applied_off))
  end

  test "should show applied_off" do
    get :show, :id => applied_offs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => applied_offs(:one).to_param
    assert_response :success
  end

  test "should update applied_off" do
    put :update, :id => applied_offs(:one).to_param, :applied_off => { }
    assert_redirected_to applied_off_path(assigns(:applied_off))
  end

  test "should destroy applied_off" do
    assert_difference('AppliedOff.count', -1) do
      delete :destroy, :id => applied_offs(:one).to_param
    end

    assert_redirected_to applied_offs_path
  end
end
