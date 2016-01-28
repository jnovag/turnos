class Recepcion < Turno
	before_save :set_time

	validates :nombre, presence: true
	validates :asunto, presence: true, length: {maximum: 50}


	def set_time
		self.hora_ingreso = Time.now
	end

	def to_atencion
		atencion = self.becomes!(Atencion)
		atencion.save!
	end
end