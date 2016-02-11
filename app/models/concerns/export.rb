module Export
	extend ActiveSupport::Concern

	class_methods do
		# Metodo para generara archivos csv
		# Exporta todo el contenido de la tabla
		# Ejemplo:
		# Apartamento.to_csv
		# "id,numero|n1,224|n2,7"
		# Retorno
		# String en formato csv

		def to_csv
			CSV.generate do |csv|
				csv << methods_to_export
				all.each do |record|
					csv << methods_to_export.map { |field| record.send(field) }
				end
			end
		end

		def methods_to_export
			column_names
		end
	end
end