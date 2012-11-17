def odd? n
  n[0] == 1
end

def even? n
  n[0] == 0
end

def gen_collatz_seq n
  seq = Array.new
  seq << n
  while n > 1 do
    if even? n then
      n = n/2
    else
      n = 3*n + 1
	end

	seq << n
  end

  seq
end

n = ARGV[0].to_i
max_val, max = 0, 0

def is_big? n
  test = true
  for i in 0..9 do
    if n[i] == 1 then test = false end
  end
  test
end

hash = Array.new(n+1,0)
for i in 1..n do
#if is_big? i then
#   puts i
# end

  val = hash[i]
  if val == 0 then
    #Generate squance
    seq = gen_collatz_seq i
    len = seq.count
    hash[i] = len

	if i < n/2 then hash[i*2] = len + 1 end
	if i < n/4 then hash[i*4] = len + 2 end
  else
    len = val
  end

  if len > max_val then
	  max = i
	  max_val = len
  end
end

puts max
puts max_val
