require 'test_helper'

module Guides
  class RateNdsesControllerTest < ActionDispatch::IntegrationTest
    test "should get create" do
      get rate_ndses_create_url
      assert_response :success
    end

    test "should get update" do
      get rate_ndses_update_url
      assert_response :success
    end

    test "should get destroy" do
      get rate_ndses_destroy_url
      assert_response :success
    end

    test "should get index" do
      get rate_ndses_index_url
      assert_response :success
    end

    test "should get show" do
      get rate_ndses_show_url
      assert_response :success
    end

  end
end