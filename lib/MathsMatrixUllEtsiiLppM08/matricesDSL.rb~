require './lib/MathsMatrixUllEtsiiLppM08/version.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_densa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_dispersa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/frac_main.rb'
include MathsMatrixUllEtsiiLppM08

class MatrizDSL < Matriz
    attr_reader :operacion, :salida, :tipo_m1, :tipo_m2, :m1, :m2, :mr #densa o dispersa
    
    def initialize (operador) #Estructura de datos de la matriz DSL
      @operacion = operador.downcase
      @tipo_m1,@tipo_m2 = nil,nil
      @m1,@m2 = nil, nil
      @salida = "console" #la salida puede ser por fichero o por consola, esta opcion se ejecuta por defecto
 
    end 

    def option(cadena) #Recoge la opcion de tipo de matriz
      case cadena.downcase
      when "densas"
	  @tipo_m1,@tipo_m2 = "densa","densa"
      when "dispersas"
	  @tipo_m1,@tipo_m2 = "dispersa","dispersa"
      when "fix","fich","fichero"
	  @salida = "fichero"
      end
      if (@tipo_m1==nil)
	if cadena=="densa"
	  @tipo_m1 = "densa"
	else
	    @tipo_m1 = "dispersa"
	end
      end
      if (@tipo_m2==nil)
	if cadena=="densa"
	  @tipo_m2 = "densa"
	else
	  @tipo_m2 = "dispersa"
	end
      end
    end
    
    def to_s # Muestra por pantalla el valor del objeto
      out_string = "";
      control=0
      out_string << @m1.to_s
      case @operacion
	when "suma","sum"
	  out_string << "+\n"
	when "resta","res"
	  out_string << "-\n"
	when "producto","multiplicacion","multi"
	  out_string << "*\n"
	when "traspuesta","tras"
	  out_string << "traspuesta\n"
	  control=1
	when "maximo","max"
	  out_string << "elemento max\n"
	  control=1
	when "minimo","min"
	  out_string << "elemento min\n"
	  control=1
      end
      if control==0
	out_string << @m2.to_s
      end
      out_string << "=\n"
      out_string << @mr.to_s
      out_string
    end
    
   
    def operand(contenido) #construye una matriz a partir del array que recoge por parámetro
      if (@m1.is_a?(MatrizDensa) or @m1.is_a?(MatrizDispersa)) == false
	if @tipo_m1=="densa"
	  @m1= MatrizDensa.new(contenido)
	else
	  @m1= MatrizDispersa.new(contenido)
	end
      else
	if @tipo_m2=="densa"
	  @m2= MatrizDensa.new(contenido)
	  
	else
	  @m2= MatrizDispersa.new(contenido)
	  
	end
      end
    end
    
    def operar # Realiza la operacion
      case @operacion.downcase
	when "suma","sum"
	  @mr=@m1+@m2
	when "resta","res"
	  @mr=@m1-@m2
	when "producto","multiplicacion","multi"
	  @mr=@m1*@m2
	when "traspuesta","tras"
	  @mr=@m1.tras
	when "maximo","max"
	  @mr=@m1.max
	when "minimo","min"
	  @mr=@m1.min
	else #error
	  nil
	end #case
	if @salida == "fichero"
	  mats=[@m1,@m2,@mr]
	  mats.each do |i|
	    crear_fichero(i)
	  end
	  puts "Fichero <salida.txt> creado"
	end
    end
      
    def fraccion (num,den) # Siguiendo la forma de programar DSL, renombramos esta funcion para que sea mas facil e intuintiva al programador
      Fraccion.new(num,den)
    end
    
    def crear_fichero (matriz)# Crea un nuevo fichero, y escribe
      if File.exist?("salida.txt")==false
	File.open('salida.txt', 'w')
      end
      File.open('salida.txt', 'r+') do |f|
	while f.eof == false
# 	    f.readline
	    f.gets
	end
	if matriz.is_a?(Fixnum)
	  f.print "#{matriz}\n"
	else
	  f.print "["
	  for i in (0...matriz.nFil)
	    f.print "["
	    for j in (0...matriz.nCol)
	      f.print "#{matriz.matriz[i][j]}"
	      if j!=(matriz.nCol-1)
		f.print ","
	      end
	    end
	    f.print "]"
	  end
	  f.print "]\n"
	end
      end
    end

end



# ----------------------------------------------------------------
 ejemplo = MatrizDSL.new("res")
 ejemplo.option "densas"
# # ejemplo.option "fich"
# ejemplo.operand [[1,ejemplo.fraccion(2,3),3],[4,5,6],[7,8,9]]
ejemplo.operand [[1,2,3],[4,5,6],[7,8,100]]
ejemplo.operand [[1,1,1],[1,1,1],[1,1,1]]
ejemplo.operar

puts ejemplo
