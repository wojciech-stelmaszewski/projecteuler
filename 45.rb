def hexagonal n
  n*(2*n-1)
end

class Float
  
  @@is_i_eps = 1e-6;

  def is_i?
    (self - self.to_i) < @@is_i_eps 
  end
end

def m_from_k k
  (1.0+Math.sqrt(1.0-12.0*k*(-4.0*k+2.0)))/6.0
end

def n_from_m m
  (-1.0+Math.sqrt(1.0+4.0*m*(3.0*m-1.0)))/2.0
end

def is_triangle_pentagonal k
  m = m_from_k k
  if !m.is_i? then false
  else
    n = n_from_m m
    if !n.is_i? then false else true end
  end
end

i = 144 #Start of searching

while true

  k = hexagonal i

  if is_triangle_pentagonal i then
    puts k
    #puts i
    break
  end
  
  i+=1
end


