require 'test_helper'

class ComprasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get compras_new_url
    assert_response :success
  end

  test "should get edit" do
    get compras_edit_url
    assert_response :success
  end

  test "should get index" do
    get compras_index_url
    assert_response :success
  end

end
