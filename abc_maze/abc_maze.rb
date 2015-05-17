class Maze
  def initialize(filename)
    @maze = []
    File.open(filename) do |input|
      input.each_line do |line|
        @maze << line.chomp
      end
    end
    @n = @maze.size
    # puts @maze
  end
  
  def solve
    board = Array.new(@n){Array.new(@n){-1}}
    board[0][0] = 0
    ans = "impossible"
    q = Queue.new
    q.push([@maze[0][0], 0, 0])
    while !q.empty? do
      p = q.pop
      c = p[0]
      x = p[1]
      y = p[2]
      if x == @n-1 && y == @n-1
        ans = "possible"
      end
      pnext = [[x-1,y], [x+1, y], [x, y-1], [x, y+1]]
      pnext.each do |pn|
        xn = pn[0]
        yn = pn[1]
        if xn < 0 || yn < 0 || xn > @n-1 || yn > @n-1 || (xn == x && yn == y)
          next
        end
        if c == 'A' && @maze[xn][yn] == 'B' && board[xn][yn] == -1
          q.push(['B', xn, yn])
          board[xn][yn] = board[x][y] + 1
        end
        if c == 'B' && @maze[xn][yn] == 'C' && board[xn][yn] == -1
          q.push(['C', xn, yn])
          board[xn][yn] = board[x][y] + 1
        end
        if c == 'C' && @maze[xn][yn] == 'A' && board[xn][yn] == -1
          q.push(['A', xn, yn])
          board[xn][yn] = board[x][y] + 1
        end
      end
    end
    # board.each do |b|
    #   p b
    # end
    return ans
  end
end

for i in 1..7 do
  maze = Maze.new("case#{i}.in.txt")
  print "#{i} #{maze.solve}\n"
end
