class Hash
	def max
		max = -1
		self.each_value { |i| if i > max then max = i end }
		max
	end
end

def read_file name
	file = File.new(name, 'r')
	result = Hash.new
	i = 0
	j = 0
	while line = file.gets
		j = 0
		line.split(' ').each do |num|
			result[[i,j]] = num.to_i
			j += 1
		end
		i += 1
	end
	return result, i, j
end

def compress tab, n, k
	result = Hash.new
	max = -1
	for i in 0...n do
		for j in 0..n-k do
			mul1, mul2 = 1, 1
			for l in j...j+k do
				mul1 *= tab[[i,l]]
				mul2 *= tab[[l,i]]
			end
			if mul1 > max then max = mul1 end
			if mul2 > max then max = mul2 end
		end
	end

	for i in 0..n-k do
		for j in 0..n-k do
			mul1, mul2 = 1, 1
			for l in 0...k do
				mul1 *= tab[[i+l,j+l]]
				mul2 *= tab[[i+l,j+k-1-l]]
			end
			if mul1 > max then max = mul1 end
			if mul2 > max then max = mul2 end
		end
	end
	max
end

tab, n, m = read_file ARGV[0]
#print tab
print compress tab, n, 4

