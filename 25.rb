def number_of_digits n
	n.to_s.split('').count
end

n = ARGV[0].to_i
#print number_of_digits n

fa, fb, count = 1, 1, 3
while true do
	t = fa
	fa = fb
	fb = fb + t
	
	if (number_of_digits fb) == n then
		print count
		break
	end
	count += 1
end

