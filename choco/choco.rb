include Math

def gcd(n,m)
  if(n > m)
    n,m = m,n
  end
  while n != 0
    n,m = m%n,n
  end
  return m
end

def factorize(n)
  d = 1
  y = rand(n)
  while d == 1
    x = y
    y = rand(n)
    d = gcd((x-y).abs,n)
    if d == n
      return 0
    end
  end
  return d
end

n = 280671392065546467397265294532969672241810318954163887187279320454220348884327

f = factorize(n)

print(f,"x",n/f,"\n")
