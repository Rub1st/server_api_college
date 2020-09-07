require 'test_helper'

module Guides
  class CurrenciesControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get guides_currencies_new_url
      assert_response :success
    end

    test "should get create" do
      get guides_currencies_create_url
      assert_response :success
    end

    test "should get update" do
      get guides_currencies_update_url
      assert_response :success
    end

    test "should get edit" do
      get guides_currencies_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get guides_currencies_destroy_url
      assert_response :success
    end

    test "should get index" do
      get guides_currencies_index_url
      assert_response :success
    end

    test "should get show" do
      get guides_currencies_show_url
      assert_response :success
    end

  end
end