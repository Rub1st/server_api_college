require 'test_helper'

class CostsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get costs_create_url
    assert_response :success
  end

  test "should get update" do
    get costs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get costs_destroy_url
    assert_response :success
  end

  test "should get index" do
    get costs_index_url
    assert_response :success
  end

  test "should get show" do
    get costs_show_url
    assert_response :success
  end

end
