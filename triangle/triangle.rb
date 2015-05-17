# -*- coding: utf-8 -*-
File.open("data.utf8.txt") do |file|
  file.each_line do |line|
    data = line.chomp.split("\s")
    data[1] = data[1].split(",")
    angle = [0, 0, 0]
    edge = [0, 0, 0]
    data[1].each do |elem|
      if elem =~ /AB|BA/
        edge[0] = elem.gsub(/AB|BA|=|cm/, "").to_i
      elsif elem =~ /BC|CB/
        edge[1] = elem.gsub(/BC|CB|=|cm/, "").to_i
      elsif elem =~ /CA|AC/
        edge[2] = elem.gsub(/CA|AC|=|cm/, "").to_i
      elsif elem =~ /角A/
        angle[0] = elem.gsub(/角A|=|度/, "").to_i
      elsif elem =~ /角B/
        angle[1] = elem.gsub(/角B|=|度/, "").to_i
      elsif elem =~ /角C/
        angle[2] = elem.gsub(/角C|=|度/, "").to_i
      end
    end
    if angle[0] == 0 && angle[1] != 0 && angle[2] != 0
      angle[0] = 180 - angle[1] - angle[2]
    elsif angle[0] != 0 && angle[1] == 0 && angle[2] != 0
      angle[1] = 180 - angle[2] - angle[0]
    elsif angle[0] != 0 && angle[1] != 0 && angle[2] == 0
      angle[2] = 180 - angle[0] - angle[1]
    end
    # print data[0], "\n"
    # print "angle = ", angle, "\n"
    # print "edge = ", edge, "\n"
    if (angle[0] == 60 && angle[1] == 60) || (angle[1] == 60 && angle[2] == 60) ||
        (angle[2] == 60 && angle[0] == 60) ||
        (edge[0] != 0 && edge[0] == edge[1] && edge[1] == edge[2]) ||
        (edge[0] != 0 && edge[0] == edge[1] && (angle[0] == 60 || angle[1] == 60 || angle[2] == 60)) ||
        (edge[1] != 0 && edge[1] == edge[2] && (angle[0] == 60 || angle[1] == 60 || angle[2] == 60)) ||
        (edge[2] != 0 && edge[2] == edge[0] && (angle[0] == 60 || angle[1] == 60 || angle[2] == 60))
      # print data[0], " あ ", data[2], "\n"
      if data[2] != "あ"
        print data[0], ","
      end
    elsif (angle[0] != 0 && angle[0] == angle[1]) || (angle[1] != 0 && angle[1] == angle[2]) ||
        (angle[2] != 0 && angle[2] == angle[0]) || (edge[0] != 0 && edge[0] == edge[1]) ||
        (edge[1] != 0 && edge[1] == edge[2]) || (edge[2] != 0 && edge[2] == edge[0])
      # print data[0], " い ", data[2], "\n"
      if data[2] != "い"
        print data[0], ","
      end
    else
      # print data[0], " う ", data[2], "\n"
      if data[2] != "う"
        print data[0], ","
      end
    end
  end
end
