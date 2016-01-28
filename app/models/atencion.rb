class Atencion < Turno

	validates :comentario, presence: true, length: {minimum: 10}
	validates :descripcion, presence: true, length: {minimum: 10}

	def to_atendido
		atendido = self.becomes!(Atendido)
		atendido.hora_finalizacion = Time.now
		atendido.save!
	end
	
end
