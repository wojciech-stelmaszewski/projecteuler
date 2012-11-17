require 'Prime'

class Integer
  def is_pandigital?
    hash = Hash.new(0)
    n = self.to_s.length
    self.to_s.split('').each do |digit|
      hash[digit.to_i] += 1
    end

    (1..n).each do |i|
      if hash[i] != 1 then return false end
    end

    true
  end

  def is_prime?
    border = Math.sqrt(self).ceil
    
    if self == 1 then return false end

    if self == 2 or self == 3 then 
      return true 
    end

    if self%2 == 0 then return false end
    (3..border).step(2) do |n|
      if self%n == 0 then return false end
    end

    true
  end

end

def generate_all_n_pandigital n
  if n < 1 or n > 9 then return nil end
  a = Array.new
  (1..n).each { |n| a << n.to_s }
  a.permutation.map do |perm|
    perm.join.to_i
  end
end

def find_greatest_pandigital
  found = false
  max = 0
  (1..9).reverse_each do |i|
    (generate_all_n_pandigital i).each do |num|
      if num.is_prime? then
        found = true
        if num > max then
          max = num 
        end
      end
    end
    if found then return max end
  end
end


puts find_greatest_pandigital

