class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :agencia

	enum estado: [:inactivo, :activo]
	enum rol: [:admin, :operativo, :gerente]

	#has_secure_password
end
