require 'test_helper'

class TypeOfContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get type_of_contracts_new_url
    assert_response :success
  end

  test "should get create" do
    get type_of_contracts_create_url
    assert_response :success
  end

  test "should get update" do
    get type_of_contracts_update_url
    assert_response :success
  end

  test "should get edit" do
    get type_of_contracts_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get type_of_contracts_destroy_url
    assert_response :success
  end

  test "should get index" do
    get type_of_contracts_index_url
    assert_response :success
  end

  test "should get show" do
    get type_of_contracts_show_url
    assert_response :success
  end

end
