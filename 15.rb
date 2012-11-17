n = ARGV[0].to_i

tab = Hash.new

for i in 0..n do
  tab[[0,i]] = tab[[i,0]] = 1
end

for i in 1..n do
  for j in 1..n do
    tab[[i,j]] = tab[[i-1,j]] + tab[[i,j-1]]
  end
end

puts tab[[n,n]]

