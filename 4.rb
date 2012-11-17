def palindrome? n
	str = n.to_s
	str == str.reverse
end

def find_palindrome n
  min, max = 10**(n-1), 10**n-1
  m, ra, rb = 0, 0, 0
  max.downto(min).each do |a|
    a.downto(min).each do |b|
      if palindrome? (a*b) then
		  if a*b > m then
			  ra, rb = a, b
			  m = a*b
		  end
	  end
	end
  end

  return ra, rb
end



#puts palindrome? ARGV[0].to_i
ra, rb = find_palindrome ARGV[0].to_i
puts ra
puts rb
puts ra*rb


