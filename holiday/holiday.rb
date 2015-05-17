require 'date'
class Holiday
  def initialize(filename)
    @holidays = []
    File.open(filename) do |file|
      file.each_line do |line|
        @holidays << line.chomp.split("/")
      end
    end
    @holidays.each_index do |i|
      @holidays[i].each_index do |j|
        @holidays[i][j] = @holidays[i][j].to_i
      end
    end
    # p @holidays
  end
  
  def calendar(year, month)
    hol = []
    @holidays.each do |holiday|
      if holiday[0] == year && holiday[1] == month
        hol << holiday[2]
      end
    end
    # p hol
    cal = Array.new(6){Array.new(7){0}}
    day = Time.local(year, month, 1).wday
    for i in 0.. 30 do
      if Date::valid_date?(year, month, i+1) && (i+day) % 7 != 0 && (i+day) % 7 != 6 && !hol.include?(i+1)
        cal[(day+i)/7][(day+i)%7] = 1
      end
    end
    return cal
  end
  
  
  def solve
    res = 0
    for year in 2006..2015 do
      for month in 1..12 do
        smax = 0
        cal = calendar(year, month)
        for x0 in 0..5 do
          for y0 in 0..6 do
            for x1 in x0+1..6 do
              for y1 in y0+1..7 do
                flag = true
                for x in x0..x1-1 do
                  for y in y0..y1-1 do
                    if cal [x][y] == 0
                      flag = false
                      break
                    end
                  end
                end
                if flag
                  s = (x1- x0) * (y1 - y0)
                  smax = [s, smax].max
                end
              end
            end
          end
        end
        print "#{year} #{month} #{smax}\n"
        res += smax
      end
    end
    return res
  end
end

holiday = Holiday.new("holiday.txt")
p holiday.solve
