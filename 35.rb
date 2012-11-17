require_relative 'intExt'

n = ARGV[0].to_i

class Array
  def rotation
    Enumerator.new do |y|
      for i in 0...self.size do
        y << Array.new(self)
        push shift
      end
    end
  end
end

class Integer
  def generate_digits_permutations
    (self.to_s.split('').map { |i| i.to_i }).rotation.map { |i| (i.inject { |a,b| a.to_s + b.to_s }).to_i }
  end

  def circular_prime?
    generate_digits_permutations.all? { |n| n.is_prime? }
  end
end

count = 0
for i in 1...n do
  if i.circular_prime? then count+=1 end
end

puts count

