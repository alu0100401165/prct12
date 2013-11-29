# = matriz_densa.rb
#
# Autor:: Juan Francisco Chávez González, Rafael Abadía Reyes
# Web:: https://github.com/alu0100401165/prct11
#
# === Clase Matriz Densa
#
# Definición de la clase _MatrizDensa_ compuesta por
# * metodo initialize
# * metodo max
# * metodo min
#


require './lib/MathsMatrixUllEtsiiLppM08/matriz.rb'
#require 'matriz.rb'

module MathsMatrixUllEtsiiLppM08

        class MatrizDensa < Matriz

                def initialize(matriz)
                 super(matriz)
		 
                end
          
		def max
		  maximo=@matriz[0][0]
		      (@nFil).times do |i|
			  (@mCol).times do |j|
			  if(@matriz[i][j]>maximo)
			    maximo=@matriz[i][j]
			  end
			end
		      end
		     maximo
		end
		
		def min
		  minimo=@matriz[0][0]
		      (@nFil).times do |i|
			(@mCol).times do |j|
			  if(@matriz[i][j]<minimo)
			    minimo=@matriz[i][j]
			  end
			end
		      end
		     minimo
		end
        end
end