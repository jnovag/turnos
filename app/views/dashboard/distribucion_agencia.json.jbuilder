json.array! @agencias do |agencia, turnos|
	json.label agencia.try(:nombre)
	json.value turnos.count
end