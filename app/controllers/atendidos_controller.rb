class AtendidosController < ApplicationController
	before_action :authenticate_usuario!
  def index
  	@atendidos = Atendido.all
  	respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Listado de Atendidos"  # Excluding ".pdf" extension.
      end
    end
  end

  def show
  	@atendido = Atendido.find(params[:id])
  end
end
