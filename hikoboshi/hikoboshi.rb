def solve(n)
  cow = []
  forbidden = []
  q = Queue.new
  for i in 1..n-1 do
    for x in 0..i do
      if !forbidden.include?([x,i])
        cow << [x,i]
        q.push([x,i])
      end
    end
    for y in 0..i-1 do
      if !forbidden.include?([i,y])
        cow << [i,y]
        q.push([i,y])
      end
    end
    while !q.empty? do
      c = q.pop
      i = 2
      x = c[0] * i
      y = c[1] * i
      while x < n && y < n
        forbidden << [x, y]
        i += 1
        x = c[0] * i
        y = c[1] * i
      end
    end
  end
  p cow
  p forbidden
  return cow.size
end

puts solve(7777)
