# -*- coding: cp932 -*-
include Math
require "fileutils"

input1 = "answer.txt"
input2 = "output_8.txt"

in_fn1 = open(input1, "r")
in_fn2 = open(input2, "r")
out_fn = open("diff.txt","w")
n_line = 0

while (line1 = in_fn1.gets) do
  line2 = in_fn2.gets
  line1.chomp!
  line2.chomp!
  size = line1.size

  for i in 0..size-1 do
    if (line1[i].chr != line2[i].chr) then
      out_fn.print(line2[i].chr)
    end
  end

end

in_fn1.close
in_fn2.close
out_fn.close
