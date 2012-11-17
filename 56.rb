n = ARGV[0].to_i

class Array
	def to_i_sum
		self.inject{|sum,x| sum.to_i + x.to_i}
	end
end

class Integer
	def sum_of_digits
		self.to_s.split('').to_i_sum
	end
end

max = 0
for a in 1..n do
	for b in 1..n do
		num = a**b
		sum = num.sum_of_digits.to_i
		if sum > max then max = sum end
	end
end

#puts (n.sum_of_digits)
puts max

