require 'thread'
require 'net/http'
require 'uri'
require "fileutils"
include FileUtils

ids = Array.new
ids[0] = 5426528869786
ids[1] = 4363616111476
ids[2] = 5092488161056
ids[3] = 8838746292440

answer = open("answer.txt","r")
line = answer.gets
line.chomp!
line = line.split(",")
judge = false

for j in 0..line.size-2 do
  line[j] = line[j].to_i
  line[j+1] = line[j+1].to_i

  for i in 0..3 do
    if(line[j] == ids[i]) then
      print("#{ids[i]} ok\n")
    end
  end

  for n in 0..10 do
    uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{line[j]}&nth=#{n}")
    id_next = Net::HTTP.get(uri).to_i
    if(id_next == line[j+1]) then
      judge = true
      succeed = n
      break
    end
  end

  if(judge) then
    print("#{line[j]} to #{line[j+1]} succeed n = #{succeed}\n")
  else
    print("failure\n")
  end
end

