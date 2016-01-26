class CreateAgencias < ActiveRecord::Migration
  def change
    create_table :agencias do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :zona
      t.integer :numero

      t.timestamps null: false
    end
  end
end
