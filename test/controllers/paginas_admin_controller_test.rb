require 'test_helper'

class PaginasAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get editar_tendencias" do
    get paginas_admin_editar_tendencias_url
    assert_response :success
  end

  test "should get editar_elementos" do
    get paginas_admin_editar_elementos_url
    assert_response :success
  end

  test "should get editar_temas" do
    get paginas_admin_editar_temas_url
    assert_response :success
  end

  test "should get editar_presentacion" do
    get paginas_admin_editar_presentacion_url
    assert_response :success
  end

  test "should get ver_presentacion" do
    get paginas_admin_ver_presentacion_url
    assert_response :success
  end

  test "should get proyectos" do
    get paginas_admin_proyectos_url
    assert_response :success
  end

  test "should get revision_proyecto" do
    get paginas_admin_revision_proyecto_url
    assert_response :success
  end

  test "should get pedidos_articulos" do
    get paginas_admin_pedidos_articulos_url
    assert_response :success
  end

  test "should get editar_productos" do
    get paginas_admin_editar_productos_url
    assert_response :success
  end

end
