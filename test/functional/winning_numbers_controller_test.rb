require 'test_helper'

class WinningNumbersControllerTest < ActionController::TestCase
  setup do
    @winning_number = winning_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:winning_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create winning_number" do
    assert_difference('WinningNumber.count') do
      post :create, winning_number: { winning_number_1: @winning_number.winning_number_1, winning_number_2: @winning_number.winning_number_2, winning_number_3: @winning_number.winning_number_3, winning_number_4: @winning_number.winning_number_4, winning_number_5: @winning_number.winning_number_5, winning_number_6: @winning_number.winning_number_6, winning_number_bonus: @winning_number.winning_number_bonus, winning_numbers_date: @winning_number.winning_numbers_date }
    end

    assert_redirected_to winning_number_path(assigns(:winning_number))
  end

  test "should show winning_number" do
    get :show, id: @winning_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @winning_number
    assert_response :success
  end

  test "should update winning_number" do
    put :update, id: @winning_number, winning_number: { winning_number_1: @winning_number.winning_number_1, winning_number_2: @winning_number.winning_number_2, winning_number_3: @winning_number.winning_number_3, winning_number_4: @winning_number.winning_number_4, winning_number_5: @winning_number.winning_number_5, winning_number_6: @winning_number.winning_number_6, winning_number_bonus: @winning_number.winning_number_bonus, winning_numbers_date: @winning_number.winning_numbers_date }
    assert_redirected_to winning_number_path(assigns(:winning_number))
  end

  test "should destroy winning_number" do
    assert_difference('WinningNumber.count', -1) do
      delete :destroy, id: @winning_number
    end

    assert_redirected_to winning_numbers_path
  end
end
