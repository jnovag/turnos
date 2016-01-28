require 'test_helper'

class RecepcionesControllerTest < ActionController::TestCase
  setup do
    @recepcion = recepciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recepciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recepcion" do
    assert_difference('Recepcion.count') do
      post :create, recepcion: { asunto: @recepcion.asunto, descripcion: @recepcion.descripcion, nombre: @recepcion.nombre }
    end

    assert_redirected_to recepcion_path(assigns(:recepcion))
  end

  test "should show recepcion" do
    get :show, id: @recepcion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recepcion
    assert_response :success
  end

  test "should update recepcion" do
    patch :update, id: @recepcion, recepcion: { asunto: @recepcion.asunto, descripcion: @recepcion.descripcion, nombre: @recepcion.nombre }
    assert_redirected_to recepcion_path(assigns(:recepcion))
  end

  test "should destroy recepcion" do
    assert_difference('Recepcion.count', -1) do
      delete :destroy, id: @recepcion
    end

    assert_redirected_to recepciones_path
  end
end
