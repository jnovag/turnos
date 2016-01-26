require 'test_helper'

class AgenciasControllerTest < ActionController::TestCase
  setup do
    @agencia = agencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agencia" do
    assert_difference('Agencia.count') do
      post :create, agencia: { direccion: @agencia.direccion, nombre: @agencia.nombre, numero: @agencia.numero, telefono: @agencia.telefono, zona: @agencia.zona }
    end

    assert_redirected_to agencia_path(assigns(:agencia))
  end

  test "should show agencia" do
    get :show, id: @agencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agencia
    assert_response :success
  end

  test "should update agencia" do
    patch :update, id: @agencia, agencia: { direccion: @agencia.direccion, nombre: @agencia.nombre, numero: @agencia.numero, telefono: @agencia.telefono, zona: @agencia.zona }
    assert_redirected_to agencia_path(assigns(:agencia))
  end

  test "should destroy agencia" do
    assert_difference('Agencia.count', -1) do
      delete :destroy, id: @agencia
    end

    assert_redirected_to agencias_path
  end
end
