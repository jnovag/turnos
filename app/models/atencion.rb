class Atencion < Turno

	def to_atendido
		atendido = self.becomes!(Atendido)
		atendido.save!
	end
	
end
