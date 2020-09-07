require 'test_helper'

module Customs
  
  class StatusOfBootingInEquipmentsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get customs_status_of_booting_in_equipments_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_status_of_booting_in_equipments_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_status_of_booting_in_equipments_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_status_of_booting_in_equipments_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_status_of_booting_in_equipments_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_status_of_booting_in_equipments_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_status_of_booting_in_equipments_show_url
      assert_response :success
    end

  end
end