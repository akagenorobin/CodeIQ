cost_matrix = [[0,7,12,8,11,7],
               [3,0,10,7,13,2],
               [4,8,0,9,12,3],
               [6,6,9,0,10,7],
               [7,7,11,10,0,5],
               [9,7,8,9,10,0]]

class Milk
  def initialize(cost_matrix)
    @cost_matrix = cost_matrix
  end
  
  def rec(i, used, root, cost)
    used[i] = true
    root << i
    costmin = 10000000
    rootmin = []
    for j in 0..5 do
      if !used[j]
        c, r = rec(j, used, root, cost + @cost_matrix[i][j])
        if costmin > c
          costmin = c
          rootmin = r
        end
      end
    end
    if !used.include?(false)
      rootmin = Marshal.load(Marshal.dump(root))
      rootmin << 0
      costmin = cost + @cost_matrix[i][0]
      # p rootmin
      # p costmin
    end
    root.pop
    used[i] = false
    return costmin, rootmin
  end
end

milk = Milk.new(cost_matrix)
used = Array.new(6){false}
root = []
cost, root = milk.rec(0, used, root, 0)
p cost
p root
