class Turno < ActiveRecord::Base
	belongs_to :agencia
	belongs_to :usuario_ingreso, class_name: 'Usuario'
	belongs_to :usuario_atencion, class_name: 'Usuario'
	
	enum estado: [:ingresado, :atendido, :finalizado]
end
