require 'test_helper'

class LotterySelectionsControllerTest < ActionController::TestCase
  setup do
    @lottery_selection = lottery_selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lottery_selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lottery_selection" do
    assert_difference('LotterySelection.count') do
      post :create, lottery_selection: { lottery_selection_1: @lottery_selection.lottery_selection_1, lottery_selection_2: @lottery_selection.lottery_selection_2, lottery_selection_3: @lottery_selection.lottery_selection_3, lottery_selection_4: @lottery_selection.lottery_selection_4, lottery_selection_5: @lottery_selection.lottery_selection_5, lottery_selection_6: @lottery_selection.lottery_selection_6, lottery_selection_date: @lottery_selection.lottery_selection_date, syndicate_id: @lottery_selection.syndicate_id }
    end

    assert_redirected_to lottery_selection_path(assigns(:lottery_selection))
  end

  test "should show lottery_selection" do
    get :show, id: @lottery_selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lottery_selection
    assert_response :success
  end

  test "should update lottery_selection" do
    put :update, id: @lottery_selection, lottery_selection: { lottery_selection_1: @lottery_selection.lottery_selection_1, lottery_selection_2: @lottery_selection.lottery_selection_2, lottery_selection_3: @lottery_selection.lottery_selection_3, lottery_selection_4: @lottery_selection.lottery_selection_4, lottery_selection_5: @lottery_selection.lottery_selection_5, lottery_selection_6: @lottery_selection.lottery_selection_6, lottery_selection_date: @lottery_selection.lottery_selection_date, syndicate_id: @lottery_selection.syndicate_id }
    assert_redirected_to lottery_selection_path(assigns(:lottery_selection))
  end

  test "should destroy lottery_selection" do
    assert_difference('LotterySelection.count', -1) do
      delete :destroy, id: @lottery_selection
    end

    assert_redirected_to lottery_selections_path
  end
end
