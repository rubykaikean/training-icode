require 'test_helper'

class XxxxxesControllerTest < ActionController::TestCase
  setup do
    @xxxxx = xxxxxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xxxxxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xxxxx" do
    assert_difference('Xxxxx.count') do
      post :create, xxxxx: { age: @xxxxx.age, description: @xxxxx.description, name: @xxxxx.name }
    end

    assert_redirected_to xxxxx_path(assigns(:xxxxx))
  end

  test "should show xxxxx" do
    get :show, id: @xxxxx
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xxxxx
    assert_response :success
  end

  test "should update xxxxx" do
    patch :update, id: @xxxxx, xxxxx: { age: @xxxxx.age, description: @xxxxx.description, name: @xxxxx.name }
    assert_redirected_to xxxxx_path(assigns(:xxxxx))
  end

  test "should destroy xxxxx" do
    assert_difference('Xxxxx.count', -1) do
      delete :destroy, id: @xxxxx
    end

    assert_redirected_to xxxxxes_path
  end
end
