require 'test_helper'

class GeneralsControllerTest < ActionController::TestCase
  setup do
    @general = generals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general" do
    assert_difference('General.count') do
      post :create, :general => @general.attributes
    end

    assert_redirected_to general_path(assigns(:general))
  end

  test "should show general" do
    get :show, :id => @general.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @general.to_param
    assert_response :success
  end

  test "should update general" do
    put :update, :id => @general.to_param, :general => @general.attributes
    assert_redirected_to general_path(assigns(:general))
  end

  test "should destroy general" do
    assert_difference('General.count', -1) do
      delete :destroy, :id => @general.to_param
    end

    assert_redirected_to generals_path
  end
end
