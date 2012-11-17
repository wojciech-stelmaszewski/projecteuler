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
    if self == 2 or self == 3 then return true end
    if self%2 == 0 then return false end
    (3..border).step(2) do |n|
      if self%n == 0 then return false end
    end
    true
  end

end

