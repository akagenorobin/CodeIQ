class Shiritori
  def initialize(filename)
    @countries = []
    File.open(filename) do |file|
      file.each_line do |line|
        @countries << line.chomp!
      end
    end
    @hs = Hash.new
    @countries.each do |country1|
      @hs[country1] = []
      @countries.each do |country2|
        if country1 == country2
          next
        elsif country1[country1.length-1] == country2[0].downcase
          @hs[country1] << country2
        end 
      end
    end
  end
  
  def rec(c, used, a)
    used[c] = true
    a << c
    cmax = a.size
    if cmax == 8
      a.each do |c|
        print "#{c} -> "
      end
      print "\n"
    end
    @hs[c].each do |cnext|
      if !used[cnext]
        cmax = [rec(cnext, used, a), cmax].max
      end
    end
    used[c] = false
    a.pop
    return cmax
  end

  def solve
    used = Hash.new
    cmaxmax = 0
    @countries.each do |country|
      @countries.each do |c|
        used[c] = false
      end
      a = []
      cmax = rec(country, used, a)
      # print "#{country} #{cmax}\n"
      cmaxmax = [cmaxmax ,cmax].max
    end
    return cmaxmax
  end
end

shiritori = Shiritori.new("country.txt")
puts shiritori.solve
