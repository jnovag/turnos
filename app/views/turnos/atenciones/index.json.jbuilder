json.array!(@turnos) do |turno|
  json.extract! turno, :id, :asunto, :descripcion
  json.url turno_url(turno, format: :json)
end
