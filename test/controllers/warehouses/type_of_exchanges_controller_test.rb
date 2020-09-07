require 'test_helper'

class TypeOfExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get type_of_exchanges_new_url
    assert_response :success
  end

  test "should get create" do
    get type_of_exchanges_create_url
    assert_response :success
  end

  test "should get update" do
    get type_of_exchanges_update_url
    assert_response :success
  end

  test "should get edit" do
    get type_of_exchanges_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get type_of_exchanges_destroy_url
    assert_response :success
  end

  test "should get index" do
    get type_of_exchanges_index_url
    assert_response :success
  end

  test "should get show" do
    get type_of_exchanges_show_url
    assert_response :success
  end

end
