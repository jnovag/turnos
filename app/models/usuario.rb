class Usuario < ActiveRecord::Base
	belongs_to :agencia

	enum estado: [:inactivo, :activo]
	enum rol: [:admin, :operativo, :gerente]

	has_secure_password
end
