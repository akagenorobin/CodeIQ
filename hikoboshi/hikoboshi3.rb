class Hikoboshi
  def initialize
    @n = 0
    @ans = 0
  end  

  def relprime(a, b)
    c = a + b
    while c < @n do
      # print "#{b} #{c}\n"
      relprime(b, c)
      @ans += 1
      c += b
    end
  end
  
  def solve(n)
    @n = n
    @ans = 0
    relprime(1, 1)
    return @ans*2 + 3
  end
end

hikoboshi = Hikoboshi.new
# print "7 #{hikoboshi.solve(7)}\n"
# print "77 #{hikoboshi.solve(77)}\n"
# print "777 #{hikoboshi.solve(777)}\n"
# print "7777 #{hikoboshi.solve(7777)}\n"
# print "77777 #{hikoboshi.solve(77777)}\n"
print "777777 #{hikoboshi.solve(777777)}\n"
# print "7777777 #{hikoboshi.solve(7777777)}\n"
