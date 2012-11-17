def divide_by_1_n? n, m
	(n/2+1..n).each do |i|
		if  m%i != 0 then return false end
	end
	true
end

i = 20
result = 0
while true
	if divide_by_1_n? ARGV[0].to_i, i then
		result = i
		break
	end
	i += 20
end

puts result
#puts divide_by_1_n? ARGV[0].to_i, ARGV[1].to_i

