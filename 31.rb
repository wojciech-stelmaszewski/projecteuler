class Integer
  # gamma([a1,a2,a3,...,ak], z) =
  # 1) z/ak iff k == 1
  # 2) = sum(p=0,p=gamma([ak], z)-1){gamma[a1,a2,a3,...,ak-1](z-p*k)}
  def gamma coeffs
    return self/coeffs.last + 1 if coeffs.length == 1
    (0...(self.gamma [coeffs.last])).reduce(0) { |sum, gamma_coeff|
      sum + ((self-gamma_coeff*coeffs.last).gamma coeffs.first(coeffs.length - 1))
    }
  end
end

start_time = Time.now.to_f
result = 200.gamma [2,5,10,20,50,100,200]
end_time = Time.now.to_f

puts "Result (#{result}) found in #{(end_time-start_time).round(3)} seconds."