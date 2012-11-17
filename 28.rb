n = ARGV[0].to_i

if n.even? then return end

k = 3
l = 2
sum = 1
for i in 1..(n/2) do
  #sum += l+k-2
  #sum += l+2*k-3
  #sum += l+3*k-4
  #sum += l+4*k-5

  sum += 4*l + 10*k - 14

  l += (k*4-4)
  k += 2
end

puts sum
