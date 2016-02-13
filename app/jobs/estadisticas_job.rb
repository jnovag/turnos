class EstadisticasJob < ActiveJob::Base
  queue_as :default

  def perform
    Estadisticas.reporte.deliver
  end
end
