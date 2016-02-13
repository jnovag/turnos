# Preview all emails at http://localhost:3000/rails/mailers/estadisticas
class EstadisticasPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/estadisticas/reporte
  def reporte
    Estadisticas.reporte
  end

end
