def fibonacci(max)
	i1, i2 = 1, 1
	while i1 <= max
		yield i1
		i1, i2 = i2, i1+i2
	end
end

def fibonacci_even(max)
	i1, i2 = 1, 1
	while i1 <= max
		if(i1&1 == 0) then yield i1 end
		i1, i2 = i2, i1+i2
	end
end

sum = 0
fibonacci_even(ARGV[0].to_i) { |i| sum += i }

puts sum

