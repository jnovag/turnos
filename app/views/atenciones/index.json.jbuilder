json.array!(@atenciones) do |atencion|
  json.extract! atencion, :id, :descripcion, :comentario
  json.url atencion_url(atencion, format: :json)
end
