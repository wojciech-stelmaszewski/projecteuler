class Integer
  def palindome?
    self.to_s == self.to_s.reverse
  end

  def lychrel?
    a = self
    b = self.to_s.reverse.to_i

    for i in 0...50 do
      c = a + b
      if c.palindome? then return false end
      a = c
      b = c.to_s.reverse.to_i
    end

    true

  end
end

n = ARGV[0].to_i

count = 0
for i in 1..n do
  if i.lychrel? then count += 1 end
end

puts count
