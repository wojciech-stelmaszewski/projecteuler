require 'bigdecimal'
require 'bigdecimal/util'

$precision_offset = 5

def sum_of_digits number, n
  sum = 0;
  number.round(n + $precision_offset).to_digits[/\S{1,#{n+1}}/].each_char do |c|
    sum += c.to_i
  end
  sum
end

n = ARGV[0].to_i
m = ARGV[1].to_i
m_sqrt = Math.sqrt(m)

sum = 0
for i in 1..m do
  number = BigDecimal(i)
  number = number.sqrt (n + $precision_offset)
  sum_of_d = sum_of_digits number, n
  if sum_of_d > m_sqrt then
    sum += sum_of_d
  end
end

puts sum

#number = BigDecimal(2)
#number = number.sqrt (n + $precision_offset)
#puts sum_of_digits number, n
