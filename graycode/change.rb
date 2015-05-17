# -*- coding: cp932 -*-
include Math
require "fileutils"

input = ARGV[0].to_s
FileUtils.cp(input, input+".bak")
FileUtils.touch("output_8c.txt")

in_fn = open(input, "r")
out_fn = open("output_8c.txt","w")
n_line = 0

while (line = in_fn.gets) do
  line.chomp!
  size = line.size

  if (n_line <= 127) then
    line[0] = "0"
  end
  if (n_line >= 128) then
    line[0] = "1"
  end

  if (n_line%4 == 0 || n_line%4 == 3) then
    line[7] = "0"
  end
  if (n_line%4 == 1 || n_line%4 == 2) then
    line[7] = "1"
  end

  if (n_line%8 == 0 || n_line%8 == 1 || n_line%8 == 6 || n_line%8 == 7) then
    line[6] = "0"
  end
  if (n_line%8 == 2 || n_line%8 == 3 || n_line%8 == 4 || n_line%8 == 5) then
    line[6] = "1"
  end

  if (n_line%16 == 0 || n_line%16 == 1 || n_line%16 == 2 || n_line%16 == 3 || n_line%16 == 12 || n_line%16 == 13 || n_line%16 == 14 || n_line%16 == 15) then
    line[5] = "0"
  end
  if (n_line%16 == 4 || n_line%16 == 5 || n_line%16 == 6 || n_line%16 == 7 || n_line%16 == 8 || n_line%16 == 9 || n_line%16 == 10 || n_line%16 == 11) then
    line[5] = "1"
  end

  #for i in 0..size-1 do
    #if (line[i].chr == "0") then
    #if (i == size-1) then
    #end
  #end
  out_fn.print(line,"\n")
  n_line += 1
end

in_fn.close
out_fn.close
