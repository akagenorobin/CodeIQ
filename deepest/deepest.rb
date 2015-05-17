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

qu = Queue.new
hsh = Hash.new

for i in 2..2 do
  print("i = #{i}\n")
  while(!qu.empty?) do
    qu.pop
  end
  
  n = 0
  id_now = ids[i]
  id_next = 1
  
  while(id_next != 0) do
    uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{id_now}&nth=#{n}")
    id_next = Net::HTTP.get(uri).to_i
    judge = true
    if(id_next != 0) then
      if(!hsh.key?(id_next)) then
        qu.push(id_next)
        hsh[id_next] = id_now
      end
    end
    n += 1
  end

  while(!qu.empty?) do
    n = 0
    id_now = qu.pop

    uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{id_now}&nth=100000000")
    id_next = Net::HTTP.get(uri).to_i
    if(id_next != 0) then
      print("#{id_now} crazy\n")
      next
    end

    id_next = 1
    while(id_next != 0) do
      uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{id_now}&nth=#{n}")
      id_next = Net::HTTP.get(uri).to_i
      judge = true
      if(id_next == ids[i+1]) then
        hsh[id_next] = id_now
        print("n = #{n} #{id_now} #{id_next} push\n")
        break
      end
      if(id_next != 0) then
        uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{id_next}&nth=0")
        id_next_next = Net::HTTP.get(uri).to_i
        if(id_next_next != 0 && !hsh.key?(id_next)) then
          qu.push(id_next)
          hsh[id_next] = id_now
          print("n = #{n} #{id_now} #{id_next} push\n")
        else
          print("n = #{n} #{id_now} #{id_next} dummy\n")
        end
      end
      n += 1
    end
    if(id_next == ids[i+1]) then
      break
    end
    print(qu.size, " remains\n")
  end

  root = Array.new
  id_now = ids[i+1]
  root[0] = id_now
  j = 1
  while(id_now != ids[i]) do
    arrive = true
    if(!hsh.key?(id_now)) then
      print("could not arrive\n")
      arrive = false
      break
    end
    judge = false
    for n in 0..100 do
      uri = URI.parse("http://133.242.134.37/deepest.cgi?id=#{hsh[id_now]}&nth=#{n}")
      id_next = Net::HTTP.get(uri).to_i
      if(id_next == id_now) then
        judge = true
        succeed = n
        break
      end
    end
    if(judge) then
      print("n = #{succeed} succeed\n")
    else
      print("failure\n")
    end
    id_now = hsh[id_now]
    root[j] = id_now
    j += 1
  end
  
  if(arrive) then
    result = open("result#{i}.txt","w")
    for k in 0..root.size-1 do
      j = root.size-1-k
      result.print(root[j], ",")
    end
    result.close
  end
end

