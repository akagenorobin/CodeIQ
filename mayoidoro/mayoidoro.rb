class Solver

  def initialize
    @dp = Array.new(100000)
    for i in 1..99999 do
      @dp[i] = 0
    end
  end

  def rec(i)
    if @dp[i]>0
      return @dp[i]
    end
    if i==1
      return @dp[i]=2
    end
    if i>1
      for j in 1..i-1 do
        if j==i-1
          @dp[i] += 2*rec(j)
        else
          @dp[i] += rec(j)
        end
      end
      @dp[i] += 1
    end
    return @dp[i]
  end

  def ans(n)
    ans = 0
    for i in 1..(n+1)/2 do
      ans += rec(i)
    end
    return ans
  end

end

solver = Solver.new
n = STDIN.gets.to_i
ans = solver.ans(n)
print "#{ans}\n"
