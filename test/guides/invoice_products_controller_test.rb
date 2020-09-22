require 'test_helper'

module Guides
  class InvoiceProductsControllerTest < ActionDispatch::IntegrationTest
    test "should get create" do
      get invoice_products_create_url
      assert_response :success
    end

    test "should get update" do
      get invoice_products_update_url
      assert_response :success
    end

    test "should get destroy" do
      get invoice_products_destroy_url
      assert_response :success
    end

    test "should get index" do
      get invoice_products_index_url
      assert_response :success
    end

    test "should get show" do
      get invoice_products_show_url
      assert_response :success
    end

  end
end