class AtendidosController < ApplicationController
  def index
  	@atendidos = Atendido.all
  end

  def show
  	@atendido = Atendido.find(params[:id])
  end
end
