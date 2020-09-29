require 'test_helper'

class RateVatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rate_vats_create_url
    assert_response :success
  end

  test "should get update" do
    get rate_vats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rate_vats_destroy_url
    assert_response :success
  end

  test "should get index" do
    get rate_vats_index_url
    assert_response :success
  end

  test "should get show" do
    get rate_vats_show_url
    assert_response :success
  end

end
