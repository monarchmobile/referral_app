require 'test_helper'

class ReferralsControllerTest < ActionController::TestCase
  setup do
    @referral = referrals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referrals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referral" do
    assert_difference('Referral.count') do
      post :create, referral: { card_given: @referral.card_given, comments: @referral.comments, date_submitted: @referral.date_submitted, inside: @referral.inside, preferred_contact: @referral.preferred_contact, string: @referral.string, urgency: @referral.urgency }
    end

    assert_redirected_to referral_path(assigns(:referral))
  end

  test "should show referral" do
    get :show, id: @referral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referral
    assert_response :success
  end

  test "should update referral" do
    put :update, id: @referral, referral: { card_given: @referral.card_given, comments: @referral.comments, date_submitted: @referral.date_submitted, inside: @referral.inside, preferred_contact: @referral.preferred_contact, string: @referral.string, urgency: @referral.urgency }
    assert_redirected_to referral_path(assigns(:referral))
  end

  test "should destroy referral" do
    assert_difference('Referral.count', -1) do
      delete :destroy, id: @referral
    end

    assert_redirected_to referrals_path
  end
end
