def sum_of_digits n
	a, sum = n.to_s.split(''), 0
	a.each do |digit|
		sum += digit.to_i
	end
	sum
end

def power_of_two_sum_of_digits n
	sum_of_digits 2**n
end

print power_of_two_sum_of_digits ARGV[0].to_i
