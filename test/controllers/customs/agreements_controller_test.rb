require 'test_helper'

module Customs
  class AgreementsControllerTest < ActionDispatch::IntegrationTest

    test "should get new" do
      get customs_agreements_new_url
      assert_response :success
    end

    test "should get create" do
      get customs_agreements_create_url
      assert_response :success
    end

    test "should get update" do
      get customs_agreements_update_url
      assert_response :success
    end

    test "should get edit" do
      get customs_agreements_edit_url
      assert_response :success
    end

    test "should get destroy" do
      get customs_agreements_destroy_url
      assert_response :success
    end

    test "should get index" do
      get customs_agreements_index_url
      assert_response :success
    end

    test "should get show" do
      get customs_agreements_show_url
      assert_response :success
    end

  end
end
