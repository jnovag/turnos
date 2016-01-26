class CreateTurnos < ActiveRecord::Migration
  def change
    create_table :turnos do |t|
      t.references :agencia, index: true
      t.string :nombre
      t.string :asunto
      t.text :descripcion
      t.datetime :hora_ingreso
      t.datetime :hora_atencion
      t.datetime :hora_finalizacion
      t.text :comentario
      t.references :usuario_ingreso, index: true
      t.references :usuario_atencion, index: true
      t.integer :estado, default: 0

      t.timestamps null: false
    end
  end
end
