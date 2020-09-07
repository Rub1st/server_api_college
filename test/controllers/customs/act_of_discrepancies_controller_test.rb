require 'test_helper'

module Customs
  class ActOfDiscrepanciesControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get customs_act_of_discrepancies_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_act_of_discrepancies_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_act_of_discrepancies_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_act_of_discrepancies_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_act_of_discrepancies_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_act_of_discrepancies_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_act_of_discrepancies_show_url
      assert_response :success
    end

  end
end