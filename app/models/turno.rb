class Turno < ActiveRecord::Base
	belongs_to :agencia
	
	enum estado: [:ingresado, :atendido, :finalizado]
end
