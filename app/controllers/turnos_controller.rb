class TurnosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_turno, only: [:show, :edit, :update, :destroy]

  # GET /turnos
  # GET /turnos.json
  def index
    @turnos = Turno.all
  end

  # GET /turnos/1
  # GET /turnos/1.json
  def show
  end

  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turno
      @turno = Turno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turno_params
      params.require(:turno).permit(:agencia, :nombre, :asunto, :descripcion, :hora_ingreso, :hora_atencion, :hora_finalizacion, :comentario, :usuario_ingreso_id, :usuario_atencion_id, :estado)
    end
end
