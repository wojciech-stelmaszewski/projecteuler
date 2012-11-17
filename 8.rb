def read_file name
	file = File.new(name, 'r')
	text = String.new
	while line = file.gets
		#puts line
		text += line.gsub /\s+/, ''
	end
	text
end

def find_largest_product n_a, n
	max = 0
	for i in 0..(n_a.size - n)
		slice = n_a[i...(i+n)]
		if slice.include? "0" then next end
		p = 1
		slice.each { |i| p = p*(i.to_i) }
		if p > max then max = p end
		#puts "#{slice}\n"
		#puts "#{p}\n"
	end
	max
end


text = read_file ARGV[0]
text = text.split ''

puts find_largest_product text, ARGV[1].to_i

#puts "\n\n\n#{text}"
