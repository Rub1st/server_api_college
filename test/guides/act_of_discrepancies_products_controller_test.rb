require 'test_helper'

module Guides
  class ActOfDiscrepanciesProductsControllerTest < ActionDispatch::IntegrationTest
    test "should get create" do
      get act_of_discrepancies_products_create_url
      assert_response :success
    end

    test "should get update" do
      get act_of_discrepancies_products_update_url
      assert_response :success
    end

    test "should get destroy" do
      get act_of_discrepancies_products_destroy_url
      assert_response :success
    end

    test "should get index" do
      get act_of_discrepancies_products_index_url
      assert_response :success
    end

    test "should get show" do
      get act_of_discrepancies_products_show_url
      assert_response :success
    end

  end
end