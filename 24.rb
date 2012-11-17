puts (0..9).to_a.permutation.to_a[10e5.to_i - 1].inject { |s,n| s.to_s + n.to_s }
