json.array!(@turnos) do |turno|
  json.extract! turno, :id, :agencia, :nombre, :asunto, :descripcion, :hora_ingreso, :hora_atencion, :hora_finalizacion, :comentario, :usuario_ingreso_id, :usuario_atencion_id, :estado
  json.url turno_url(turno, format: :json)
end
