json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nombre, :apellido, :agencia, :rol, :estado, :codigo, :correo, :login, :cedula, :password_digest
  json.url usuario_url(usuario, format: :json)
end
