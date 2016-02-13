class Estadisticas < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.estadisticas.reporte.subject
  #
  def reporte
  	@promedio_agencia = Atendido.promedio_agencia
  	@promedio_usuario = Atendido.promedio_usuario
  	@promedio_espera = Atendido.promedio_espera_dia
  	@promedio_atencion = Atendido.promedio_atencion_dia
  	
    @greeting = "Hi"
    usuarios = Usuario.admin.map(&:email).join(',')
    mail to: usuarios
  end
end
