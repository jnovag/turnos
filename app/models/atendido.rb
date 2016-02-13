class Atendido < Turno
	def self.promedio_espera_dia(dia = Time.now)
		result_set = registros_por_dia(dia)
		sumatoria = result_set.map do |turno|
			turno.hora_atencion - turno.hora_ingreso
		end.sum
		if result_set.empty? then	
			0
		else
			(sumatoria / result_set.count ) / 60
		end
	end

	def self.promedio_atencion_dia(dia = Time.now)
		result_set = registros_por_dia(dia)
		sumatoria = result_set.map do |turno|
			turno.hora_finalizacion - turno.hora_atencion
		end.sum
		if result_set.empty? then	
			0
		else
			(sumatoria / result_set.count ) / 60
		end
	end

	def self.promedio_usuario(dia = Time.now)
		result_set = registros_por_dia(dia)
		result_set.group_by(&:usuario_atencion).map do |usuario, turnos|
			suma = turnos.map { |turno| turno.hora_finalizacion - turno.hora_atencion }.sum
			{usuario: usuario, promedio: suma / result_set.count, conteo: turnos.count}
		end
	end

	def self.promedio_agencia(dia = Time.now)
		result_set = registros_por_dia(dia)
		result_set.group_by(&:agencia).map do |agencia, turnos|
			suma_atencion = turnos.map { |turno| turno.hora_finalizacion - turno.hora_atencion }.sum
			suma_espera = turnos.map { |turno| turno.hora_atencion - turno.hora_ingreso }.sum
			{agencia: agencia,
			 promedio_atencion: suma_atencion / result_set.count, promedio_espera: suma_espera / result_set.count, conteo: turnos.count}
		end
	end

	def self.registros_por_dia(dia = Time.now)
		inicio = dia.at_beginning_of_day
		final = dia.at_end_of_day
		query = "created_at >= ? and created_at <= ?"
		where(query, inicio, final)
	end

end