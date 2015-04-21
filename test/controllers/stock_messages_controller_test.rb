require 'test_helper'

class StockMessagesControllerTest < ActionController::TestCase
  setup do
    @stock_message = stock_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_message" do
    assert_difference('StockMessage.count') do
      post :create, stock_message: { message: @stock_message.message }
    end

    assert_redirected_to stock_message_path(assigns(:stock_message))
  end

  test "should show stock_message" do
    get :show, id: @stock_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_message
    assert_response :success
  end

  test "should update stock_message" do
    patch :update, id: @stock_message, stock_message: { message: @stock_message.message }
    assert_redirected_to stock_message_path(assigns(:stock_message))
  end

  test "should destroy stock_message" do
    assert_difference('StockMessage.count', -1) do
      delete :destroy, id: @stock_message
    end

    assert_redirected_to stock_messages_path
  end
end
