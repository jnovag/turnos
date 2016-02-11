class AtencionesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_atencion, only: [:atendido, :show, :edit, :update, :destroy]

  # GET /atenciones
  # GET /atenciones.json
  def index
    @atenciones = Atencion.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Listado de Atenciones"  # Excluding ".pdf" extension.
      end
    end
  end

  # GET /atenciones/1
  # GET /atenciones/1.json
  def show
  end

  # GET /atenciones/new
  def new
    @atencion = Atencion.new
  end

  # GET /atenciones/1/edit
  def edit
  end

  # POST /atenciones
  # POST /atenciones.json
  def create
    @atencion = Atencion.new(atencion_params)

    respond_to do |format|
      if @atencion.save
        format.html { redirect_to @atencion, notice: 'Atencion was successfully created.' }
        format.json { render :show, status: :created, location: @atencion }
      else
        format.html { render :new }
        format.json { render json: @atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atenciones/1
  # PATCH/PUT /atenciones/1.json
  def update
    respond_to do |format|
      if @atencion.update(atencion_params)
        format.html { redirect_to @atencion, notice: 'Atencion was successfully updated.' }
        format.json { render :show, status: :ok, location: @atencion }
      else
        format.html { render :edit }
        format.json { render json: @atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atenciones/1
  # DELETE /atenciones/1.json
  def destroy
    @atencion.destroy
    respond_to do |format|
      format.html { redirect_to atenciones_url, notice: 'Atencion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def atendido
    @atencion.to_atendido
    redirect_to recepciones_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atencion
      @atencion = Atencion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atencion_params
      params.require(:atencion).permit(:descripcion, :comentario)
    end
end
