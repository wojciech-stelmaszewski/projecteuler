require_relative 'intExt'

#puts ARGV[0].to_i.is_prime?

a_limit = ARGV[0].to_i
b_limit = ARGV[1].to_i

a_max = -1
b_max = -1
i_max = -1

def quadratic a, b, n
  n**2 + a*n + b
end

for a in (-a_limit+1)..(a_limit) do
  for b in (-b_limit+1)..(b_limit) do
    i = 0
    while true do
      num = quadratic a, b, i

      if num < 0 then break end

      if !num.is_prime? then
        if i > i_max then
          i_max = i
          a_max = a
          b_max = b
        end
        break
      end
      i+=1
    end
  end
end

puts (a_max * b_max)

