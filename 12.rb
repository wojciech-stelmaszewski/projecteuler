#1) 1 = 1 | 1
#2) 1 + 2 = 3 | 1, 3
#3) 1 + 2 + 3 = 6 | 1, 2, 3, 6
#4) 1 + 2 + 3 + 4 = 10 | 1, 2, 5, 10
#5) 1 + 2 + 3 + 4 + 5 = 15 | 1, 3, 5, 15
#6) 1 + 2 + 3 + 4 + 5 + 6 = 21 | 1, 3, 7, 21
#7) 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28 | 1, 2, 4, 7, 14, 28
#8) 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 = 36 | 1, 2, 3, 4, 6, 9, 12, 18, 36

def sigma_0 fact
	sigma_0 = 1
	fact.each do |key,value|
		sigma_0 *= (value + 1)
	end
	sigma_0
end

def factorization n
	fact = Hash.new 0
	while true
		if n == 1 then break end
		i = 2
		while true
			if n%i == 0 then break end
			i += 1
		end
		fact[i] += 1
		n = n/i
	end
	fact
end

def generate_triangle_numbers n
	sum = 0
  i = 1
  while true do
		sum += i
    n_of_divs = sigma_0 factorization sum
		#print sum.to_s + ": " + n_of_divs.to_s + "\n"
    if n_of_divs > n then return sum end
    i += 1
	end
end

puts generate_triangle_numbers ARGV[0].to_i

#generate_triangle_numbers ARGV[0].to_i
#print factorization ARGV[0].to_i
