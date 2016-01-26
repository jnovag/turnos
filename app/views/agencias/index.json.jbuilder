json.array!(@agencias) do |agencia|
  json.extract! agencia, :id, :nombre, :direccion, :telefono, :zona, :numero
  json.url agencia_url(agencia, format: :json)
end
