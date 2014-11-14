class LimitedNumber
  def initialize length = 10, value = 1
    @array = Array.new length, 0
    value_array = i_to_array value
    (0...length).each { |i|
      @array[i] = value_array[i].nil? ? 0 : value_array[i]
    }
  end

  def to_s
    @array.reverse.join
  end

  def to_i
    number = 0
    (0...@array.length).each { |i|
      number += @array[i]*(10**i)
    }
    number
  end

  def mul! number
    number_s = number.to_s.reverse
    result = Array.new @array.length, 0
    (0...number_s.length).each { |i|
      digit = number_s[i].to_i
      shift = 0
      (0...@array.length).each { |j|
        if i+j >= @array.length
          break
        end
        product = @array[j]*digit+result[i+j] + shift
        value = product%10
        result[i+j] = value
        shift = product/10
      }
    }

    (0...@array.length).each{ |i|
      @array[i] = result[i]
    }
  end

  def i_to_array number
    number_s = number.to_s.reverse
    number_length = number_s.length
    array = Array.new number_length, 0
    (0...number_s.length).each { |i|
      array[i] = number_s[i].to_i
    }
    array
  end

  private :i_to_array
end

class LimitedNumberSimple
  def initialize digits, number
    @digits = digits
    @number = number
  end

  def mul! multiplier
    @number *= multiplier
    @number = @number.to_s
      .reverse
      .slice(0,@digits)
      .to_s
      .reverse
      .to_i
  end

  def to_s
    result_s = @number.to_s
    if result_s.length < @digits
      result_s =
          (Array.new @digits-result_s.length, '0').join + result_s
    end
    result_s
  end

  def to_i
    @number
  end

end

##We want to calculate the last ten digits of 28433*2**7830457+1 non-Mersenne prime number.

#number = LimitedNumber.new 10, 1

##Because 2**7830457 equals 783045 times 2**10 times 2**7 (in other words 783045*10+7)
#_2_to_10_power = 2**10
#(0...783045).each { |_|
#  number.mul! _2_to_10_power
#}

#number.mul! 2**7

#puts (LimitedNumber.new 10, number.to_i*28433 + 1).to_s

### OTHER SOLUTION (BETTER AND SIMPLER) ###

#We want to calculate the last ten digits of 28433*2**7830457+1 non-Mersenne prime number.

number = LimitedNumberSimple.new 10, 1

#Because 2**7830457 equals 783045 times 2**10 times 2**7 (in other words 783045*10+7)
_2_to_10_power = 2**10
(0...783045).each { |_|
  number.mul! _2_to_10_power
}

number.mul! 2**7

puts (LimitedNumber.new 10, number.to_i*28433 + 1).to_s
