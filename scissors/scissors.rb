def n_cut(x,y)
  n = 0
  while true
    if y%x == 0
      break
    end
    if y%x != 0
      n += 1
      x,y = y%x,x
    end
  end
  return n
end

def fibo(n)
  x = 1
  y = 1
  for i in 1..n+1
    x,y = y,x+y
  end
  return x,y
end

n = 40
x,y = fibo(n)

print(x,"x",y,"\n")
