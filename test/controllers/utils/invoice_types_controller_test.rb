require 'test_helper'

module Utils
  class InvoiceTypesControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get utils_invoice_types_new_url
      assert_response :success
    end

    test "should get create" do
      get utils_invoice_types_create_url
      assert_response :success
    end

    test "should get update" do
      get utils_invoice_types_update_url
      assert_response :success
    end

    test "should get edit" do
      get utils_invoice_types_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get utils_invoice_types_destroy_url
      assert_response :success
    end

    test "should get index" do
      get utils_invoice_types_index_url
      assert_response :success
    end

    test "should get show" do
      get utils_invoice_types_show_url
      assert_response :success
    end

  end
end