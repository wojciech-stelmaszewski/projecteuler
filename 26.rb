MAX_CYCLE_OFFSET = 10000
MAX_CYCLE_LENGTH = 1000 #For 1/p max cycle length cant be larger than (p-1)
MAX_ZERO_SECTION_LENGTH = 100
CYCLE_DETECTION_THRESHOLD = 7

class Integer

  def only_2_or_5_are_proper_dividers?
    n = self
    while n > 1 do
      previous_n = n
      n /= 2 if n%2 == 0
      n /= 5 if n%5 == 0
      return false if previous_n == n
    end
    true
  end

end

def get_decimal_expansion_section nominator, denominator, offset, length
  number = Rational(nominator, denominator)
  number = (number*(10**offset))
  number = number - number.truncate
  (number*(10**(length))).truncate
end

def length_of_cycle_in_decimal_expansion d
  outer_cycle_length = 0
  (0..MAX_CYCLE_OFFSET).each{|offset|

    nil_decimal_expansion_test_result = get_decimal_expansion_section(1, d, offset, MAX_ZERO_SECTION_LENGTH)
    if nil_decimal_expansion_test_result == 0 then
      break
    end

    next_decimal_section_was_ever_greater_than_zero = false
    (1..MAX_CYCLE_LENGTH).each{|cycle_length|
      inner_cycle_found = true
      (0..CYCLE_DETECTION_THRESHOLD).each{|x|
        this_decimal_section = get_decimal_expansion_section(1, d, offset + cycle_length*x, cycle_length)
        next_decimal_section = get_decimal_expansion_section(1, d, offset + (cycle_length*(x + 1)), cycle_length)
        inner_cycle_found = false if this_decimal_section != next_decimal_section

        if next_decimal_section != 0 then
          next_decimal_section_was_ever_greater_than_zero = true
        end

        if(inner_cycle_found == false) then break end
      }

      if(!next_decimal_section_was_ever_greater_than_zero && cycle_length > MAX_ZERO_SECTION_LENGTH) then
        break
      end

      decimal_expansion = get_decimal_expansion_section(1, d, offset, cycle_length)

      if decimal_expansion != 0 && inner_cycle_found then
        outer_cycle_length = cycle_length
        break
      end
    }

    return outer_cycle_length if outer_cycle_length != 0
  }
  nil
end

MAX_NUMBER = 1000

time_start = Time.now.to_f

#result_array = Array.new
max_number = -1
max_cycle_length = -1
(1..MAX_NUMBER).reverse_each{|x|
  next if x.only_2_or_5_are_proper_dividers?
  cycle_length = length_of_cycle_in_decimal_expansion x

  if(cycle_length > max_cycle_length) then
    max_number = x
    max_cycle_length = cycle_length
  end

  break if(cycle_length == (x - 1))
}
time_end = Time.now.to_f

puts "The largest cycle (length equals #{max_cycle_length}) in decimal expansion has #{max_number}."

puts "Calculations took #{(time_end-time_start).round(3)} seconds."
