require 'test_helper'

class VigentesControllerTest < ActionDispatch::IntegrationTest
  test "should get cambiar" do
    get vigentes_cambiar_url
    assert_response :success
  end

end
