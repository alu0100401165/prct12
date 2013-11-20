#! /usr/local/ruby/bin/ruby 

require './lib/MathsMatrixUllEtsiiLppM08/frac_main.rb'
#require'frac_main.rb'

class Matriz

  attr_accessor :nFil , :mCol, :matriz

  def initialize (matriz)
    @nFil = matriz.size
    @mCol = matriz[0].size
    @matriz = matriz
  end

  def to_s
    matString = ""
    for i in 0...@nFil do
      for j in 0...@mCol do
        matString = matString + @matriz[i][j].to_s + " "
      end
      matString = matString + "\n"
    end
    matString
  end
  
   # Metodo para calcular el determinante de una matriz
  def det
    if (@nFil == @mCol)
    det = @matriz[0][0]
    aux = Matriz.new(@matriz)
    for k in 0...@nFil do
      l = k+1
      for i in l...@mCol do
        for j in l...@mCol do
          aux.matriz[i][j] = (aux.matriz[k][k] * aux.matriz[i][j] - aux.matriz[k][j] * aux.matriz[i][k])/ aux.matriz[k][k]
        end
      end
      det = det * aux.matriz[k][k]
    end
    else
    det = "ERROR, la matriz no es cuadrada"
    end
    det
  end

  # Método para calcular la traspuesta de una matriz
  def tras
    result = Array.new
      for i in 0...@nFil do
        result[i] = Array.new
        for j in 0...@mCol do
          result[i][j] = 0
        end
      end

    aux = Matriz.new(result)
    for i in 0...@nFil do
      for j in 0...@mCol do
        aux.matriz[i][j] = @matriz[j][i]
      end
    end
    aux
  end
  
  # Metodo para multiplicar una matriz por un escalar
  def x(escalar)
    aux = Matriz.new(@matriz)
    for i in 0...@nFil do
      for j in 0...@mCol do
        aux.matriz[i][j] = @matriz[i][j] * escalar
      end
    end
    aux
  end

  #Metodo para sumar dos matrices
  def +(mat)
    if (mat.nFil == @nFil && mat.mCol == @mCol)
      aux = Matriz.new(@matriz)
      for i in 0...@nFil do
        for j in 0...@mCol do
          aux.matriz[i][j] = @matriz[i][j] + mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para restar dos matrices
  def -(mat)
    if (mat.nFil == @nFil && mat.mCol == @mCol)
      aux = Matriz.new(@matriz)
      for i in 0...@nFil do
        for j in 0...@mCol do
          aux.matriz[i][j] = @matriz[i][j] - mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para multiplicar dos matrices
  def *(mat)
    if (@mCol == mat.nFil)
      result = Array.new
      for i in 0...@nFil do
        result[i] = Array.new
        for j in 0...mat.mCol do
	  if(@matriz[i][j].class==Fraccion)
           result[i][j] = Fraccion.new(0,1)
	  else
	    result[i][j] = 0
	  end
        end
      end

      aux = Matriz.new(result)

      for i in 0...@nFil do
        for j in 0...mat.mCol do
          for z in 0...@mCol do
            aux.matriz[i][j] += @matriz[i][z] * mat.matriz[z][j]
          end
        end
      end
    else
      aux = 0
    end
    aux
  end
  
  # Metodo para comparar la igualdad de dos matrices
  def ==(mat)
    if ((@mCol == mat.mCol)&&(@nFil == mat.nFil))
      for i in 0...@nFil do
	for j in 0...@mCol do
	  if ((@matriz[i][j] == mat.matriz[i][j])==false)
	    return false
	  end
	end
      end
   
    else
     return false
    end
   return true 
  end
   
end

 
