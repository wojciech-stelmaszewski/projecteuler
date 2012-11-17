def prime_factors n
	while n != 1
		i = (2..n).find { |i| n%i == 0 }
		yield i
		n = n/i
	end
end

max = 0;
#prime_factors(ARGV[0].to_i) { |i| puts i }
prime_factors(ARGV[0].to_i) { |i| max = i }
puts max
#puts Array.new(prime_factors(ARGV[0].to_i))[-1]

