require 'test_helper'

module Warehouses
  class WarehousesControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get warehouses_warehouses_new_url
      assert_response :success
    end

    test "should get create" do
      get warehouses_warehouses_create_url
      assert_response :success
    end

    test "should get update" do
      get warehouses_warehouses_update_url
      assert_response :success
    end

    test "should get edit" do
      get warehouses_warehouses_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get warehouses_warehouses_destroy_url
      assert_response :success
    end

    test "should get index" do
      get warehouses_warehouses_index_url
      assert_response :success
    end

    test "should get show" do
      get warehouses_warehouses_show_url
      assert_response :success
    end

  end
end