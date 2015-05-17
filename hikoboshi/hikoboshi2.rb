def relprime(x, y)
  ans = true
  while true do
    # print "#{x} #{y}\n"
    if x == 1
      break
    end
    if y % x == 0
      ans = false
      break
    else
      x, y = y%x, x
    end
  end
  return ans
end

def solve(n)
  ans = 0
  for x in 1..n-1 do
    for y in x+1..n-1 do
      if relprime(x, y)
        ans += 1
      end
      if x % 1000000 == 0 && y % 1000001 == 0
        print "#{x} #{y} #{Time.now}\n"
      end
    end
  end
  return ans*2+3
end

print "7777777 #{solve(7777777)}\n"
