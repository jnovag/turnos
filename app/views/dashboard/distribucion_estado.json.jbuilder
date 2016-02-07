json.array! @estados do |type, turnos|
	json.label type
	json.value turnos.count
end