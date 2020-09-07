require 'test_helper'

module Customs
  class InvoicesControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get customs_invoices_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_invoices_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_invoices_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_invoices_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_invoices_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_invoices_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_invoices_show_url
      assert_response :success
    end

  end
end
