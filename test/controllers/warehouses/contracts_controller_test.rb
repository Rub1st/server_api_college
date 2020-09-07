require 'test_helper'

module Warehouses
  class ContractsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get warehouses_contracts_new_url
      assert_response :success
    end

    test "should get create" do
      get warehouses_contracts_create_url
      assert_response :success
    end

    test "should get update" do
      get warehouses_contracts_update_url
      assert_response :success
    end

    test "should get edit" do
      get warehouses_contracts_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get warehouses_contracts_destroy_url
      assert_response :success
    end

    test "should get index" do
      get warehouses_contracts_index_url
      assert_response :success
    end

    test "should get show" do
      get warehouses_contracts_show_url
      assert_response :success
    end

  end
end