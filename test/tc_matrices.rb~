
require "test/unit"
require './lib/MathsMatrixUllEtsiiLppM08/matriz.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_densa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_dispersa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/frac_main.rb'
include MathsMatrixUllEtsiiLppM08


class TestMatrizDensa < Test::Unit::TestCase

  def setup

    @m1 = MatrizDensa.new([[1,3],[2,0]])
    @m2 = MatrizDensa.new([[2,1],[0,1]])
    @m3 = MatrizDensa.new([[2,0,1],[3,0,0],[5,1,1]])
    @m4 = MatrizDensa.new([[4,1,6],[2,0,1]])
    
    @m5 = MatrizDensa.new([[Fraccion.new(1,2).to_f,Fraccion.new(1,3).to_f],[Fraccion.new(1,4).to_f,Fraccion.new(1,5).to_f]])
    @m6 = MatrizDensa.new([[Fraccion.new(1,2).to_f,Fraccion.new(2,3).to_f],[Fraccion.new(3,4).to_f,Fraccion.new(4,5).to_f]])
    
    @m7 = MatrizDensa.new([[Fraccion.new(1,2),Fraccion.new(1,3)],[Fraccion.new(1,4),Fraccion.new(1,5)]])
    @m8 = MatrizDensa.new([[Fraccion.new(1,2),Fraccion.new(2,3)],[Fraccion.new(3,4),Fraccion.new(4,5)]])
    
    @m9 =  MatrizDensa.new([[Fraccion.new(1,1),Fraccion.new(1,1)],[Fraccion.new(1,1),Fraccion.new(1,1)]])
    @m10 = MatrizDensa.new([[Fraccion.new(1,2),Fraccion.new(3,5)],[Fraccion.new(11,40),Fraccion.new(49,150)]])
    
    @m11= MatrizDispersa.new([[0,0,1],[0,2,0],[3,0,0]])
    @m12= MatrizDispersa.new(([[Fraccion.new(0,1),Fraccion.new(2,3)],[Fraccion.new(0,1),Fraccion.new(0,1)]]))
  end

   def test_simple
		
    assert_equal(@m9, @m7 + @m8)
	
    assert_equal(MatrizDensa.new([[-1,2],[2,-1]]), @m1 - @m2)
    
    assert_equal(@m11.max, 3)
    
    assert_equal(@m11.min, 1)
    
   end

   def test_failure

     assert_not_equal(@m9,@m7 * @m8)
   end
     
   
end
