require 'test_helper'

class PaginasUsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get ver_proyectos" do
    get paginas_usuario_ver_proyectos_url
    assert_response :success
  end

  test "should get editar_proyecto" do
    get paginas_usuario_editar_proyecto_url
    assert_response :success
  end

  test "should get agregar_proyecto" do
    get paginas_usuario_agregar_proyecto_url
    assert_response :success
  end

end
