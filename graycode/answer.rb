# -*- coding: cp932 -*-
include Math
require "fileutils"

FileUtils.touch("answer.txt")
out_fn = open("answer.txt","w")

for i in 0..255 do
  if (i%256 < 128) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+64)%256 < 128) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+32)%128 < 64) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+16)%64 < 32) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+8)%32 < 16) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+4)%16 < 8) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+2)%8 < 4) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  if ((i+1)%4 < 2) then 
    out_fn.print("0")
  else
    out_fn.print("1")
  end

  #  out_fn.print("\n")
end

out_fn.close
