require 'test_helper'

class TurnosControllerTest < ActionController::TestCase
  setup do
    @turno = turnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turno" do
    assert_difference('Turno.count') do
      post :create, turno: { agencia: @turno.agencia, asunto: @turno.asunto, comentario: @turno.comentario, descripcion: @turno.descripcion, estado: @turno.estado, hora_atencion: @turno.hora_atencion, hora_finalizacion: @turno.hora_finalizacion, hora_ingreso: @turno.hora_ingreso, nombre: @turno.nombre, usuario: @turno.usuario, usuario_atencion_id: @turno.usuario_atencion_id, usuario_ingreso_id: @turno.usuario_ingreso_id }
    end

    assert_redirected_to turno_path(assigns(:turno))
  end

  test "should show turno" do
    get :show, id: @turno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turno
    assert_response :success
  end

  test "should update turno" do
    patch :update, id: @turno, turno: { agencia: @turno.agencia, asunto: @turno.asunto, comentario: @turno.comentario, descripcion: @turno.descripcion, estado: @turno.estado, hora_atencion: @turno.hora_atencion, hora_finalizacion: @turno.hora_finalizacion, hora_ingreso: @turno.hora_ingreso, nombre: @turno.nombre, usuario: @turno.usuario, usuario_atencion_id: @turno.usuario_atencion_id, usuario_ingreso_id: @turno.usuario_ingreso_id }
    assert_redirected_to turno_path(assigns(:turno))
  end

  test "should destroy turno" do
    assert_difference('Turno.count', -1) do
      delete :destroy, id: @turno
    end

    assert_redirected_to turnos_path
  end
end
