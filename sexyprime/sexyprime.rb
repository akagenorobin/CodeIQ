def isprime(n)
  m = Math::sqrt(n).floor
  ans = true
  for i in 2..m do
    if n % i == 0
      ans = false
      break
    end
  end
  return ans
end

for n in 2..500 do
  if isprime(n)
    if isprime(n+6)
      print "(", n, ",", n+6, "), "
    end
  end
end
print "\n"
