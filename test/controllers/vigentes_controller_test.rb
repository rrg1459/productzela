require 'test_helper'

class VigentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vigente = vigentes(:one)
  end

  test "should get index" do
    get vigentes_url
    assert_response :success
  end

  test "should get new" do
    get new_vigente_url
    assert_response :success
  end

  test "should create vigente" do
    assert_difference('Vigente.count') do
      post vigentes_url, params: { vigente: { dias: @vigente.dias } }
    end

    assert_redirected_to vigente_url(Vigente.last)
  end

  test "should show vigente" do
    get vigente_url(@vigente)
    assert_response :success
  end

  test "should get edit" do
    get edit_vigente_url(@vigente)
    assert_response :success
  end

  test "should update vigente" do
    patch vigente_url(@vigente), params: { vigente: { dias: @vigente.dias } }
    assert_redirected_to vigente_url(@vigente)
  end

  test "should destroy vigente" do
    assert_difference('Vigente.count', -1) do
      delete vigente_url(@vigente)
    end

    assert_redirected_to vigentes_url
  end
end
