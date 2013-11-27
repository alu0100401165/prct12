#! /usr/local/ruby/bin/ruby 
require './lib/MathsMatrixUllEtsiiLppM08/gcd.rb'
#require 'gcd.rb'

include Comparable
 
class Fraccion
  attr_reader :n, :d  
  
# Constructor de la clase Fraccion  
  def initialize(n,d)
    max = gcd(n,d)
    @n = n / max
    @d = d / max
  end 
 
 def num
   return @n
 end
 
 def denom
   return @d
 end
 
 # Metodo que imprime el numero racional en el formato: num/den 
 def to_s
   return %Q(#{@n}/#{@d}) 
 end
 
   def ==(other)
     if(other.class==Fixnum)
	if((other==0) && (@n==other))
	  return true
	else
	  return false
	end
   elsif((@n==other.n) && (@d==other.d))
      return true
   else
     return false
   end
   
  end
  
  def abs
     Fraccion.new(num.abs,denom.abs)
  end
  
  def reciprocal
     Fraccion.new(denom,num)
  end
  
   def -@
    Fraccion.new(-num, denom)
  end
  
   def +(other)
     if !(other.is_a? Fraccion)
       other=Fraccion.new(other,1)
     end
       
      x=(@n*other.d)+(@d*other.n)
      y=(@d*other.d)
      max_ = gcd(x,y)
      Fraccion.new(x/max_, y/max_)
 
  end
  
  def -(other)
    x=(@n*other.d)-(@d*other.n)
    y=(@d*other.d)
    max_ = gcd(x,y)
    Fraccion.new(x/max_, y/max_)
 
  end
  
  def *(other)
    x=(@n*other.n)
    y=(@d*other.d)
    max_ = gcd(x,y)
    
    Fraccion.new(x/max_, y/max_)
 
  end
  
  def /(other)
    x=(@n*other.d)
    y=(@d*other.n)
    max_ = gcd(x,y)
    Fraccion.new(x/max_, y/max_)
 
  end
  
  def % (other)
    x=(@n*other.d)
    y=(@d*other.n)
    max_ = gcd(x,y)
    x=x/max_
    y=y/max_

    if((x%y)==0)
      return 0
    else 
       return Fraccion.new(x/y, x%y) 
    end
  end
  
  def < (other)
   if((@n*other.d)<(@d*other.n))
      return true
   else
     return false
   end
  end 
 
 def > (other)
   if((@n*other.d)>(@d*other.n))
      return true
   else
     return false
   end
  end 
  
  
  
  def <= (other)
   if((@n*other.d)<=(@d*other.n))
      return true
   else
     return false
   end
  end 
 
 def >= (other)
   if((@n*other.d)>=(@d*other.n))
      return true
   else
     return false
   end
  end 
  
  
 def distinto_0
   if(denom != 0)
      return true
    else
     return false    
   end
  end 
  
  def <=>(other)
    if ((@n == other.n) && (@d == other.d))
      return 0
    end
    if ((@n * other.d) < (@d * other.n))
      return -1
    end
    if ((@n * other.d) > (@d * other.n))
      return 1 
    end
  end
   
  def to_f
   return @n.to_f/@d.to_f 
 end
 
 def coerce(other)
  [self,other]
 end
end  




