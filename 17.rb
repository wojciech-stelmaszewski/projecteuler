class Integer
  
  @@to_long_s_map = { 1 => "one", 
                      2 => "two",
                      3 => "three", 
                      4 => "four", 
                      5 => "five", 
                      6 => "six", 
                      7 => "seven", 
                      8 => "eight",
                      9 => "nine", 
                      10 => "ten", 
                      11 => "eleven", 
                      12 => "twelve", 
                      13 => "thirteen", 
                      14 => "fourteen", 
                      15 => "fifteen", 
                      16 => "sixteen", 
                      17 => "seventeen", 
                      18 => "eighteen", 
                      19 => "nineteen"}

  @@to_long_s_map_d = { 2 => "twenty", 
                        3 => "thirty", 
                        4 => "forty", 
                        5 => "fifty", 
                        6 => "sixty", 
                        7 => "seventy", 
                        8 => "eighty", 
                        9 => "ninety"}
  
  def to_long_s

    if self >= 0 and self < 20 then return @@to_long_s_map[self] end

    if self < 100 then
      d, r = self.divmod(10)
      return @@to_long_s_map_d[d] + ((r > 0) ? ("-" + @@to_long_s_map[r]) : "")
    end

    if self < 1000 then
      c, r = self.divmod(100)
      return @@to_long_s_map[c] + " hundred" + ((r > 0) ? (" and " +
                  r.to_long_s) : "")
    end

    if self == 1000 then return "one thousand" end

    ""
  end
end

def chars_count s
  ((s.delete ' ').delete '-').length
end

sum = 0
for i in 1..1000 do
  sum += (chars_count i.to_long_s)
end
puts sum

#puts (chars_count (ARGV[0].to_i).to_long_s)
