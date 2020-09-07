require 'test_helper'

module Guides
  class OwnershipFormsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get guides_ownership_forms_new_url
      assert_response :success
    end

    test "should get create" do
      get guides_ownership_forms_create_url
      assert_response :success
    end

    test "should get update" do
      get guides_ownership_forms_update_url
      assert_response :success
    end

    test "should get edit" do
      get guides_ownership_forms_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get guides_ownership_forms_destroy_url
      assert_response :success
    end

    test "should get index" do
      get guides_ownership_forms_index_url
      assert_response :success
    end

    test "should get show" do
      get guides_ownership_forms_show_url
      assert_response :success
    end

  end
end