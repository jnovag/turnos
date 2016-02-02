class Recepcion < Turno
	before_save :set_time

	validates :nombre, presence: true
	validates :asunto, presence: true, length: {maximum: 50}


	def set_time
		self.hora_ingreso = Time.now
	end

	def to_atencion(current_user)
		atencion = self.becomes!(Atencion)
		atencion.usuario_atencion = current_user
		atencion.hora_atencion = Time.now
		atencion.save(validate: false)
	end
end