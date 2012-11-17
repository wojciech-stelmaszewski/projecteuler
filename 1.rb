n = ARGV[0].to_i

def find_count n, div
	(n/div) - (n%div == 0 ? 1 : 0)
end

def find_sum n
	if n == 1 then 1
	else n/2.0*(n+1) end
end

n1 = find_count n, 3
n2 = find_count n, 5
n3 = find_count n, (3*5)

sum = (find_sum n1)*3 + (find_sum n2)*5 - (find_sum n3)*15

puts n1
puts n2

puts sum.to_i

