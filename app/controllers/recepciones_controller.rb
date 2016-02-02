class RecepcionesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_recepcion, only: [:atender, :show, :edit, :update, :destroy]

  # GET /recepciones
  # GET /recepciones.json
  def index
    @recepciones = Recepcion.where(agencia_id: current_usuario.agencia_id)
  end

  # GET /recepciones/1
  # GET /recepciones/1.json
  def show
  end

  # GET /recepciones/new
  def new
    @recepcion = Recepcion.new
  end

  # GET /recepciones/1/edit
  def edit
  end

  # POST /recepciones
  # POST /recepciones.json
  def create
    @recepcion = Recepcion.new(recepcion_params)
    @recepcion.usuario_ingreso = current_usuario
    @recepcion.agencia = current_usuario.agencia

    respond_to do |format|
      if @recepcion.save
        format.html { redirect_to @recepcion, notice: 'Recepcion was successfully created.' }
        format.json { render :show, status: :created, location: @recepcion }
      else
        format.html { render :new }
        format.json { render json: @recepcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recepciones/1
  # PATCH/PUT /recepciones/1.json
  def update
    respond_to do |format|
      if @recepcion.update(recepcion_params)
        format.html { redirect_to @recepcion, notice: 'Recepcion was successfully updated.' }
        format.json { render :show, status: :ok, location: @recepcion }
      else
        format.html { render :edit }
        format.json { render json: @recepcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recepciones/1
  # DELETE /recepciones/1.json
  def destroy
    @recepcion.destroy
    respond_to do |format|
      format.html { redirect_to recepciones_url, notice: 'Recepcion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def atender
    @recepcion.to_atencion(current_usuario)
    redirect_to edit_atencion_path(@recepcion)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recepcion
      @recepcion = Recepcion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recepcion_params
      params.require(:recepcion).permit(:nombre, :asunto, :descripcion)
    end
end
