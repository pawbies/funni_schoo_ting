require "test_helper"

class BorrowControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get borrow_new_url
    assert_response :success
  end

  test "should get create" do
    get borrow_create_url
    assert_response :success
  end

  test "should get edit" do
    get borrow_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get borrow_destroy_url
    assert_response :success
  end
end
