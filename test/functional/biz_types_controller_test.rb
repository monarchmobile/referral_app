require 'test_helper'

class BizTypesControllerTest < ActionController::TestCase
  setup do
    @biz_type = biz_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biz_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biz_type" do
    assert_difference('BizType.count') do
      post :create, biz_type: { category: @biz_type.category, code: @biz_type.code }
    end

    assert_redirected_to biz_type_path(assigns(:biz_type))
  end

  test "should show biz_type" do
    get :show, id: @biz_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @biz_type
    assert_response :success
  end

  test "should update biz_type" do
    put :update, id: @biz_type, biz_type: { category: @biz_type.category, code: @biz_type.code }
    assert_redirected_to biz_type_path(assigns(:biz_type))
  end

  test "should destroy biz_type" do
    assert_difference('BizType.count', -1) do
      delete :destroy, id: @biz_type
    end

    assert_redirected_to biz_types_path
  end
end
