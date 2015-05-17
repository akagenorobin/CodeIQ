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

def primematrix
  primes= []
  for n in 100..999 do
    if isprime(n)
      primes << n
    end
  end
  # p primes.size
  ans = 0
  primes.each do |a|
    primes.each do |b|
      primes.each do |c|
        d = (a.to_s[0] + b.to_s[0] + c.to_s[0]).to_i
        e = (a.to_s[1] + b.to_s[1] + c.to_s[1]).to_i
        f = (a.to_s[2] + b.to_s[2] + c.to_s[2]).to_i
        if [a, b, c, d, e, f].uniq.size == 6
          if primes.include?(d) && primes.include?(e) && primes.include?(f)
            # print "#{a} #{b} #{c} #{d} #{e} #{f}\n"
            ans += 1
          end
        end
      end
    end
  end
  return ans
end

p primematrix
