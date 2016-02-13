class DashboardController < ApplicationController
  before_action :authenticate_usuario!

  def index
  end

  def distribucion_agencia
  	@agencias = Turno.all.group_by(&:agencia)
  end

  def distribucion_estado
  	@estados = Turno.all.group_by(&:type)
  end

  def promedio_espera
  	@promedios = (3.weeks.ago.to_date..Date.today).map do |day|
  		[day, Atendido.promedio_espera_dia(day)]
  	end
  end

  def promedio_atencion
    @promedios = (3.days.ago.to_date..Date.today).map do |day|
      [day, Atendido.promedio_atencion_dia(day)]
    end
  end

  def send_report
    Estadisticas.reporte.deliver
    flash[:notice] = "Reporte Enviado"
    redirect_to dashboard_path
  end

end
