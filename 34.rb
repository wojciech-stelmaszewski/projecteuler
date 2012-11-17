class Integer
	
	def fact
		f = 1
		(2..self).each { |i| f = f*i }
		f
	end

	@@f = (0...10).to_a.map { |i| i.fact }
	
	def sodf #sum of digit's factors
		sum = 0
		(self.to_s.split '').each do |i|
			sum += @@f[i.to_i]
		end
		sum
	end
end

max = 10**8 - 1 #because 10**n < 9!*n for n < 8

sum = 0
(3..max).each do |i|
	if i == i.sodf then
		sum += i
	end
end

print sum
