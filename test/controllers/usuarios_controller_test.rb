require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_url
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { celular: @usuario.celular, contrasena: @usuario.contrasena, correo: @usuario.correo, f_actualizado: @usuario.f_actualizado, f_creado: @usuario.f_creado, fh_sesion: @usuario.fh_sesion, gerencia: @usuario.gerencia, nombre: @usuario.nombre, rol: @usuario.rol, telefono: @usuario.telefono, ubicacion: @usuario.ubicacion } }
    end

    assert_redirected_to usuario_url(Usuario.last)
  end

  test "should show usuario" do
    get usuario_url(@usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { celular: @usuario.celular, contrasena: @usuario.contrasena, correo: @usuario.correo, f_actualizado: @usuario.f_actualizado, f_creado: @usuario.f_creado, fh_sesion: @usuario.fh_sesion, gerencia: @usuario.gerencia, nombre: @usuario.nombre, rol: @usuario.rol, telefono: @usuario.telefono, ubicacion: @usuario.ubicacion } }
    assert_redirected_to usuario_url(@usuario)
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete usuario_url(@usuario)
    end

    assert_redirected_to usuarios_url
  end
end
