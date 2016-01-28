class AddTypeToTurnos < ActiveRecord::Migration
  def change
    add_column :turnos, :type, :string
  end
end
