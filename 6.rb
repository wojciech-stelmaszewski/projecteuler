n = ARGV[0].to_i

sumOfSqrs, sqrOfSums = 0, 0
(1..n).each do |i|
	sumOfSqrs += i**2
	sqrOfSums += i
end

sqrOfSums = sqrOfSums**2

puts sumOfSqrs
puts sqrOfSums

puts sqrOfSums - sumOfSqrs

