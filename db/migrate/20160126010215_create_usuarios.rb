class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.references :agencia, index: true
      t.integer :rol, default: 0
      t.integer :estado, default: 0
      t.string :codigo
      t.string :correo
      t.string :login
      t.string :cedula
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
