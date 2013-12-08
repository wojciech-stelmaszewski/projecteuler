require 'prime'

class FactorizationArray
  MAX_PRIME = 100000

  @@primes_array = Array.new
  @@primes_index_dictionary = Hash.new
  current_prime_index = 0
  Prime.each MAX_PRIME do |prime|
    @@primes_array.push prime
    @@primes_index_dictionary[prime] = current_prime_index
    current_prime_index += 1
  end

  @factorization_array

  def initialize number
    @factorization_array = Array.new
    number.prime_division.each { |prime_pair|
      prime_index = @@primes_index_dictionary[prime_pair[0]]
      @factorization_array[prime_index] = prime_pair[1]
    }
  end

  def set_factorization_array! other_factorization_array
    @factorization_array = other_factorization_array
  end

  def get_number
    number = 1
    @factorization_array.each_index { |index|
      current_factor = @factorization_array[index]
      next if current_factor.nil?
      number *= @@primes_array[index]**current_factor
    }
    number
  end

  def ** power
    new_factorization_array = Array.new
    @factorization_array.each_index{ |index|
      current_factor = @factorization_array[index]
      next if current_factor.nil?
      new_factorization_array[index] = current_factor * power
    }
    new_factorization_object = FactorizationArray.new 1
    new_factorization_object.set_factorization_array! new_factorization_array
    return new_factorization_object
  end

  #Redundant method.
  def == other_factorization_array
    return false if @factorization_array.length != other_factorization_array.factorization_array.length
    @factorization_array.each_index{ |index|
      return false if @factorization_array[index] != other_factorization_array.factorization_array[index]
    }
    return true
  end

  #Redundant method.
  def contains_same_factor_primes? other_factorization_array
    return false if @factorization_array.length != other_factorization_array.factorization_array.length
    @factorization_array.each_index{ |index|
      return false if @factorization_array[index].nil? != other_factorization_array.factorization_array[index].nil?
    }
    return true
  end

  attr_reader :factorization_array
  #private :set_factorization_array!
end

MAX_A = 100
MAX_B = 100

start_time = Time.new.to_f
already_defined_numbers = Array.new
(2..MAX_A).each{ |a|
  #puts "Processing #{a}..."
  factorization_array = (FactorizationArray.new a)

  #any_contains_the_same_factors = false
  #already_defined_numbers.each { |item|
  #  if item.contains_same_factor_primes? factorization_array then
  #    any_contains_the_same_factors = true
  #    break
  #  end
  #}

  (2..MAX_B).each{ |b|
    new_factorization = (factorization_array**b)
    #if any_contains_the_same_factors then
    #  next if already_defined_numbers.include? new_factorization
    #end
    already_defined_numbers.push new_factorization
  }
}

already_defined_numbers.uniq! { |item| item.factorization_array }
end_time = Time.new.to_f

puts "Answer '#{already_defined_numbers.length}' found in #{(end_time-start_time).round(3)} seconds."