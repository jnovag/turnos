json.array!(@recepciones) do |recepcion|
  json.extract! recepcion, :id, :nombre, :asunto, :descripcion
  json.url recepcion_url(recepcion, format: :json)
end
