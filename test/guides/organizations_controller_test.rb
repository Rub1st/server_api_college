require 'test_helper'

module Guides
  class OrganizationsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get guides_organizations_new_url
      assert_response :success
    end

    test "should get create" do
      get guides_organizations_create_url
      assert_response :success
    end

    test "should get update" do
      get guides_organizations_update_url
      assert_response :success
    end

    test "should get edit" do
      get guides_organizations_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get guides_organizations_destroy_url
      assert_response :success
    end

    test "should get index" do
      get guides_organizations_index_url
      assert_response :success
    end

    test "should get show" do
      get guides_organizations_show_url
      assert_response :success
    end

  end
end