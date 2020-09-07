require 'test_helper'

module Guides
  class ProductsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get guides_products_new_url
      assert_response :success
    end

    test "should get create" do
      get guides_products_create_url
      assert_response :success
    end

    test "should get update" do
      get guides_products_update_url
      assert_response :success
    end

    test "should get edit" do
      get guides_products_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get guides_products_destroy_url
      assert_response :success
    end

    test "should get index" do
      get guides_products_index_url
      assert_response :success
    end

    test "should get show" do
      get guides_products_show_url
      assert_response :success
    end

  end
end
