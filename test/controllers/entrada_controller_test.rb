require 'test_helper'

class EntradaControllerTest < ActionDispatch::IntegrationTest

  test "should get indice" do
    get entrada_indice_url
    assert_response :success
  end

  test "should get procesos" do
    get entrada_procesos_url
    assert_response :success
  end

end
