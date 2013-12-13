require './lib/MathsMatrixUllEtsiiLppM08/version.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_densa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_dispersa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/frac_main.rb'
include MathsMatrixUllEtsiiLppM08

module MathsMatrixUllEtsiiLppM08
  
class MatrizDSL < Matriz
  attr_accessor :resultado

  def initialize(tipo_operacion, &block)

      @operandos = []
      @resultado = nil
      @tipo_resultado = :densa
      @operacion = :nada
      @salida = "console" 
      @tipo_m1,@tipo_m2 = nil,nil
      
      case tipo_operacion
        when "suma"
          @operacion = :suma
        when "resta"
          @operacion = :resta
        when "multiplicacion"
          @operacion = :multiplicacion
	 when "traspuesta"
          @operacion = :traspuesta
	 when "maximo"
          @operacion = :maximo 
	 when "minimo"
          @operacion = :minimo
        else
          puts "Tipo de operacion inválido", tipo_operacion
      end

      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval &block
        end
      end
  end
  

   def operando(mat) 
      if ( @operandos[0].is_a?(MatrizDensa) or @operandos[1].is_a?(MatrizDispersa)) == false
	if @tipo_m1=="densa"
	  @operandos << MatrizDensa.new(mat)
	else
	  @operandos << MatrizDispersa.new(mat)
	end
      else
	if @tipo_m2=="densa"
	  @operandos << MatrizDensa.new(mat)
	  
	else
	  @operandos << MatrizDispersa.new(mat)
	  
	end
      end
    end
  
  def operar
    case @operacion
      when :suma
        @resultado = @operandos[0]+@operandos[1]
        @resultado.matriz
      when :resta
        @resultado = @operandos[0]-@operandos[1]
        @resultado.matriz
      when :multiplicacion
        @resultado = @operandos[0]*@operandos[1]
        @resultado.matriz
      when :traspuesta
        @resultado = @operandos[0].tras
        @resultado.matriz
      when :maximo
        @resultado = @operandos[0].max
      when :minimo
        @resultado = @operandos[0].min
      else
        puts "Tipo de operacion incorrecta", @operacion
      end
      
  end
  
  def tipo_salida(op)
    @salida=op
       if @salida == "fichero"
	  mats=[@operandos[0],@operandos[1],@resultado]
	  mats.each do |i|
	    crear_fichero(i)
	  end
	  puts "Fichero <salida.txt> creado"
	end
	
	if @salida == "console"
	  puts self
	end
  end
  
   def to_s # Muestra por pantalla el valor del objeto
      out_string = "";
      control=0
      out_string << @operandos[0].to_s
      case @operacion
	when :suma
	  out_string << "+\n"
	when :resta
	  out_string << "-\n"
	when :multiplicacion
	  out_string << "*\n"
	when :traspuesta
	  out_string << "traspuesta\n"
	  control=1
	when :maximo
	  out_string << "elemento max\n"
	  control=1
	when :minimo
	  out_string << "elemento min\n"
	  control=1
      end
      if control==0
	out_string << @operandos[1].to_s
      end
      out_string << "=\n"
      out_string << @resultado.to_s
      out_string
    end
    
    
  def option(cadena) 
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
    
    def fraccion (num,den) 
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
end  

######################################
    
 ejemplo = MatrizDSL.new("suma") do
        operando([[3,1],[5,1]])
        operando([[1,1],[1,1]])
	operar
	tipo_salida("console")
      end
      
