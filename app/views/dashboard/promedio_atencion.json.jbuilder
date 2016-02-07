json.array! @promedios do |dia, promedio|
	json.day dia
	json.value promedio
end