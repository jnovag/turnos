class AgenciasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_agencia, only: [:show, :edit, :update, :destroy]

  # GET /agencias
  # GET /agencias.json
  def index
    @agencias = Agencia.all
  end

  # GET /agencias/1
  # GET /agencias/1.json
  def show
  end

  # GET /agencias/new
  def new
    @agencia = Agencia.new
  end

  # GET /agencias/1/edit
  def edit
  end

  # POST /agencias
  # POST /agencias.json
  def create
    @agencia = Agencia.new(agencia_params)

    respond_to do |format|
      if @agencia.save
        format.html { redirect_to @agencia, notice: 'Agencia was successfully created.' }
        format.json { render :show, status: :created, location: @agencia }
      else
        format.html { render :new }
        format.json { render json: @agencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencias/1
  # PATCH/PUT /agencias/1.json
  def update
    respond_to do |format|
      if @agencia.update(agencia_params)
        format.html { redirect_to @agencia, notice: 'Agencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @agencia }
      else
        format.html { render :edit }
        format.json { render json: @agencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencias/1
  # DELETE /agencias/1.json
  def destroy
    @agencia.destroy
    respond_to do |format|
      format.html { redirect_to agencias_url, notice: 'Agencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agencia
      @agencia = Agencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agencia_params
      params.require(:agencia).permit(:nombre, :direccion, :telefono, :zona, :numero)
    end
end
