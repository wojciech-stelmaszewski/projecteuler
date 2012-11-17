class Integer
  def get_proper_divs
    divs = Array.new
    divs << 1
    for i in 2..(self/2) do
      if self % i == 0 then
        divs<<i
      end
    end
    divs
  end

  def is_abdundant?
    self.get_proper_divs.reduce(:+) > self
  end

end

def get_abdundants limit
  numbers = Array.new
  for i in 1..limit do
    if i.is_abdundant? then numbers << i end
  end
  numbers
end

#puts ((ARGV[0].to_i).get_proper_divs).to_s
#puts ((ARGV[0].to_i).is_abdundant?)

limit = 28123

abdundants = get_abdundants limit

def get_numbers_that_are_not_sum_of_two_abdundant_numbers abdundants, limit
  n = abdundants.length

  all_numbers = (1..limit).to_a

  wrong_numbers = Array.new

  for i in 0...n do
    wrong_numbers.clear
    for j in i...n do
      wrong_numbers << (abdundants[i] + abdundants[j])
    end
    all_numbers -= wrong_numbers
  end
  all_numbers
end

puts (get_numbers_that_are_not_sum_of_two_abdundant_numbers abdundants, limit).reduce(:+)
