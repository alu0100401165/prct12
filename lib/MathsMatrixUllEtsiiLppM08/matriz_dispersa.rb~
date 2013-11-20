require './lib/MathsMatrixUllEtsiiLppM08/matriz.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_densa.rb'

module MathsMatrixUllEtsiiLppM08
        class MatrizDispersa < Matriz
	  attr_accessor :nz
                def initialize(matriz)
                 super(matriz)
		 @nz=0
		    for i in 0...@nFil do
			for j in 0...@mCol do
			  if(!(@matriz[i][j]==0))
			    @nz+=1
			  end
			end
		      end
		      
		 @val=Array.new(@nz)
		 @ind=Array.new(@nz){ Array.new(2)} 
		 cont=0                    
              	     for i in 0...@nFil do
			for j in 0...@mCol do
			  if(!(@matriz[i][j]==0))
			  @val[cont]=@matriz[i][j]
			  @ind[cont][0]=i
			  @ind[cont][1]=j
		          cont+=1
			  end
			end
		      end
                end
		
		def mostrar
		  cont=0
		  for i in 0...@nFil do
			for j in 0...@mCol do
			 if(@nz>cont)
			  if((@ind[cont][0]==i) && (@ind[cont][1]==j))
	                    print "#{@val[cont]} "
			    cont+=1
			    
			  else
			    print "0 "
			  end
			 else
			   print "0 "
			 end
			end
			print "\n"
		      end
		end
		
	    def max
	      maximo=@val[0]
	      for i in 0...@nz do
		if(maximo<@val[i])
		   maximo=@val[i]
		end
	      end
	      maximo
	    end
	    
	    def min
	      minimo=@val[0]
	      for i in 0...@nz do
		if(minimo>@val[i])
		   minimo=@val[i]
		end
	      end
	      minimo
	    end    
		
        end
end

