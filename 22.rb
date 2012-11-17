def read_file name
  file = File.new(name, 'r')
  file.read
end

def prepare_names_array names_s
  names_a = (read_file ARGV[0]).split('","')
  names_a[0][0] = ''
  names_a[-1].chop!
  names_a.sort!
end

class String
  def to_i_value
    aVal = "A".bytes.to_a[0]
    sum = 0
    self.each_byte do |byte|
      sum += (byte - aVal + 1)
    end
    sum
  end
end

def calculate_names_array_total names_a
  i = 1
  sum = 0
  names_a.each do |name|
    #name_value = name.to_i_value
    #printf "%s = [%d] x %d =  %d\n", name, i, name_value, i*name_value
    sum += i * name.to_i_value
    i += 1
  end
  sum
end

names_a = prepare_names_array (read_file ARGV[0])

puts calculate_names_array_total names_a

