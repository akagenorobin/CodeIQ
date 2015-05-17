def comb(a, b)
  ans = 1
  if a == 0 || b == 0 || a == b
    return ans
  else
    for i in a-b+1..a do
      ans *= i
    end
    for i in 1..b do
      ans /= i
    end
    return ans
  end
end

def solve(n, m, k)
  p = 0
  for i in k..m do
    p += comb(n, i) * comb(n-i, 2*(m-i)) * comb(2*(m-i), m-i)
    # print "#{i} #{p}\n"
  end
  all = comb(n, m)**2
  # print "#{p} #{all}\n"
  return p * 1.0 / all
end

puts solve(2, 1, 1)
puts solve(10, 4, 2)
puts solve(20, 8, 5)
puts solve(40, 18, 8)
