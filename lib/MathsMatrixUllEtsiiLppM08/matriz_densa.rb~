require './lib/MathsMatrixUllEtsiiLppM08/matriz.rb'
#require 'matriz.rb'

module MathsMatrixUllEtsiiLppM08

        class MatrizDensa < Matriz

                def initialize(matriz)
                 super(matriz)
		 
                end
          
		def max
		  maximo=@matriz[0][0]
		      for i in 0...@nFil do
			for j in 0...@mCol do
			  if(@matriz[i][j]>maximo)
			    maximo=@matriz[i][j]
			  end
			end
		      end
		     maximo
		end
		
		def min
		  minimo=@matriz[0][0]
		      for i in 0...@nFil do
			for j in 0...@mCol do
			  if(@matriz[i][j]<minimo)
			    minimo=@matriz[i][j]
			  end
			end
		      end
		     minimo
		end
        end
end