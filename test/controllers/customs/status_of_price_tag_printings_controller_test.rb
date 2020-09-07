require 'test_helper'

module Customs
  class StatusOfPriceTagPrintingsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get customs_status_of_price_tag_printings_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_status_of_price_tag_printings_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_status_of_price_tag_printings_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_status_of_price_tag_printings_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_status_of_price_tag_printings_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_status_of_price_tag_printings_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_status_of_price_tag_printings_show_url
      assert_response :success
    end

  end
end