class String
  def palindromic?
    n = self.length
    self[0...(n/2)] == self[(n.even? ? n/2 : n/2 + 1)...n].reverse
  end
end

n = ARGV[0].to_i

sum = 0
for i in 1..n do
  if i.to_s.palindromic? and i.to_s(2).palindromic? then
    sum += i
  end
end

puts sum
