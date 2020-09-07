require 'test_helper'

module Customs
  class OperationsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get customs_operations_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_operations_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_operations_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_operations_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_operations_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_operations_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_operations_show_url
      assert_response :success
    end

  end
end