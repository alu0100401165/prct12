require './lib/MathsMatrixUllEtsiiLppM08/matriz.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_densa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/matriz_dispersa.rb'
require './lib/MathsMatrixUllEtsiiLppM08/frac_main.rb'
require 'rspec'
include MathsMatrixUllEtsiiLppM08
describe Matriz do
  
  before :each do
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
    
    @m13= MatrizDensa.new([[Fraccion.new(1,1),Fraccion.new(1,1)],[Fraccion.new(1,1),Fraccion.new(1,1)]])
    @m14= MatrizDispersa.new(([[Fraccion.new(1,2),Fraccion.new(0,1)],[Fraccion.new(0,1),Fraccion.new(0,1)]]))
    @m15 = MatrizDensa.new([[1,1],[1,1]])
    @m16 = MatrizDensa.new([[1,2,3],[4,5,6],[7,8,9]])
  end

  describe "# Se crean las matrices del tamanio especificado e inicialidas" do
    it "Se establecen correctamente las dimensiones" do
      @m1.mCol.should == 2
      @m1.nFil.should == 2
      @m3.mCol.should == 3
      @m3.nFil.should == 3
    end
    it "Se inicializa correctamente" do
      @m1.to_s.should == "1 3 \n2 0 \n"
      @m2.to_s.should == "2 1 \n0 1 \n"
      @m3.to_s.should == "2 0 1 \n3 0 0 \n5 1 1 \n"
    end
  end
  
  describe "Operaciones unarias" do
    it "Traspuesta" do
      (@m3.tras.matriz == MatrizDensa.new([[2,3,5],[0,0,1],[1,0,1]]).matriz).should be_true
    end
    it "Determinante" do
      (@m1.det.should == -6)
    end
  end

  describe "Multiplicar por un escalar" do
    it "Multiplicacion" do
      ((@m3.x(2)).matriz.should == MatrizDensa.new([[4,0,2],[6,0,0],[10,2,2]]).matriz)
      ((@m1.x(-3)).matriz.should == MatrizDensa.new([[-3,-9],[-6,0]]).matriz)
    end
  end

  describe "Operaciones con dos matrices" do
    it "Se deben poder sumar dos matrices" do
      ((@m1 + @m2).matriz.should == MatrizDensa.new([[3,4],[2,1]]).matriz)
    end
    it "Se deben poder multiplicar dos matrices" do
      ((@m1 * @m2).matriz.should == MatrizDensa.new([[2,4],[4,2]]).matriz)
      ((@m1 * @m4).matriz.should == MatrizDensa.new([[10,1,9],[8,2,12]]).matriz)
    end
    it "Se deben poder restar dos matrices" do
      ((@m1 - @m2).matriz.should == MatrizDensa.new([[-1,2],[2,-1]]).matriz)
    end
  end
  
  describe "Modificación de clase" do
    it "Sumar matrices" do
      ((@m5 + @m6).matriz.should == MatrizDensa.new([[Fraccion.new(1,1).to_f,Fraccion.new(1,1).to_f],[Fraccion.new(1,1).to_f,Fraccion.new(1,1).to_f]]).matriz)
    end 
    
    it "Multiplicar matrices" do
      ((@m5 * @m6).matriz.should == MatrizDensa.new([[Fraccion.new(1,2).to_f,Fraccion.new(3,5).to_f],[Fraccion.new(11,40).to_f,Fraccion.new(49,150).to_f]]).matriz)
    end 
    
      it "Sumar matrices 2" do
	 (@m7 + @m8).should == @m9
      end 
    
    it "Multiplicar matrices 2" do
         (@m7 * @m8).should == @m10
    end 
  end
  
    describe "Uso de matrices dispersas" do
    it "Sumar matrices" do
      ((@m3 + @m11).should == MatrizDensa.new([[2,0,2],[3,2,0],[8,1,1]]))
      ((@m7 + @m12).should == MatrizDensa.new([[Fraccion.new(1,2),Fraccion.new(1,1)],[Fraccion.new(1,4),Fraccion.new(1,5)]]))
      ((@m13 + @m14).should == MatrizDensa.new([[Fraccion.new(3,2),Fraccion.new(1,1)],[Fraccion.new(1,1),Fraccion.new(1,1)]]))
      ((@m14 + @m15).should == MatrizDensa.new([[Fraccion.new(3,2),Fraccion.new(1,1)],[Fraccion.new(1,1),Fraccion.new(1,1)]]))
    end 
    
    it "Maximo" do
      (@m11.max.should == 3)
      (@m12.max.should == Fraccion.new(2,3))
    end 
    
      it "Minimo" do
	 (@m11.min.should == 1)
	 (@m12.min.should == Fraccion.new(2,3))
      end 
    
  end
 describe "Uso de bloques" do
    it "Metodo encontrar" do
      @m16.encontrar{|e| (e*e)>=16}.should ==[1,0]
    end
  end
end
