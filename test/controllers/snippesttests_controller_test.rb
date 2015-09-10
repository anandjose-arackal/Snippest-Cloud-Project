require 'test_helper'

class SnippesttestsControllerTest < ActionController::TestCase
  setup do
    @snippesttest = snippesttests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snippesttests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snippesttest" do
    assert_difference('Snippesttest.count') do
      post :create, snippesttest: { name: @snippesttest.name }
    end

    assert_redirected_to snippesttest_path(assigns(:snippesttest))
  end

  test "should show snippesttest" do
    get :show, id: @snippesttest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snippesttest
    assert_response :success
  end

  test "should update snippesttest" do
    patch :update, id: @snippesttest, snippesttest: { name: @snippesttest.name }
    assert_redirected_to snippesttest_path(assigns(:snippesttest))
  end

  test "should destroy snippesttest" do
    assert_difference('Snippesttest.count', -1) do
      delete :destroy, id: @snippesttest
    end

    assert_redirected_to snippesttests_path
  end
end
