class GammaEvaluationFunctionHelper
  def initialize
    @values_cache = Hash.new(Hash.new(Hash.new))
  end

  def calculate alpha, k, c
    if @values_cache.has_key? k
      if @values_cache[k].has_key? alpha
        if @values_cache[k][alpha].has_key? c
          @values_cache[k][alpha][c]
        end
      end
    end
    @values_cache[k][alpha][c] = c*(c**(k-1)-10**alpha)
  end
end

class Integer
  def split
    index = -1
    self.to_s().reverse.each_char do |c|
      yield [c.to_i, index+=1]
    end
  end
end

def find_numbers k, limit, gamma_evaluation_function_helper
  (2..limit).each do |number|
    gamma_sum = 0
    number.split do |c, index|
      gamma_sum += gamma_evaluation_function_helper.calculate index, k, c
    end
    if gamma_sum == 0
      yield number
    end
  end
end

gamma_evaluation_function_helper = GammaEvaluationFunctionHelper.new

sum = 0
find_numbers 5, 299999, gamma_evaluation_function_helper do |number|
  sum += number
end

puts sum

