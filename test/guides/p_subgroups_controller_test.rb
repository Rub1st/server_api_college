require 'test_helper'

module Guides
  class PSubgroupsControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get guides_p_subgroups_new_url
      assert_response :success
    end

    test "should get create" do
      get guides_p_subgroups_create_url
      assert_response :success
    end

    test "should get update" do
      get guides_p_subgroups_update_url
      assert_response :success
    end

    test "should get edit" do
      get guides_p_subgroups_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get guides_p_subgroups_destroy_url
      assert_response :success
    end

    test "should get index" do
      get guides_p_subgroups_index_url
      assert_response :success
    end

    test "should get show" do
      get guides_p_subgroups_show_url
      assert_response :success
    end

  end
end