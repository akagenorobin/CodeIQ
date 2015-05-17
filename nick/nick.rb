include Math
require "fileutils"

in_fn = open("nick.txt", "r")

name_list = Array.new(0).map! { Array.new }

while (line = in_fn.gets) do
  overlap = 0
  line.chomp!
  for i in 0..line.size-1 do
    if (line[i].chr == "=") then
      name1 = line[0..i-1]
      name2 = line[i+1..line.size-1]
    end
  end
  for i in 0..name_list.size-1 do
    for j in 0..name_list[i].size-1 do
      if (name1 == name_list[i][j]) then
        name_list[i].push(name2)
        overlap = 1
        break
      end
      if (name2 == name_list[i][j]) then
        name_list[i].push(name1)
        overlap = 1
        break
      end
    end
    if (overlap == 1) then
      break
    end
  end
  if (overlap == 0) then
    name_list.push([name1,name2])
  end
end

in_fn.close

while (true)
  judge = 0
  for i1 in 0..name_list.size-1 do
    for j1 in 0..name_list[i1].size-1 do
      for i2 in 0..name_list.size-1 do
        for j2 in 0..name_list[i2].size-1 do
          if (i1 != i2 && name_list[i1][j1] == name_list[i2][j2]) then
            name_list[i1] = name_list[i1] | name_list[i2]
            name_list.delete(name_list[i2])
            judge = 1
            break
          end
        end
        if (judge == 1) then
          break
        end
      end
      if (judge == 1) then
        break
      end
    end
    if (judge == 1) then
      break
    end
  end
  if (judge == 0) then
    break
  end
end

for i in 0..name_list.size-1 do
  name_list[i].uniq!
  name_list[i].sort!
end

name_list.sort!

FileUtils.touch("answer.txt")
out_fn = open("answer.txt","w")

for i in 0..name_list.size-1 do
  for j in 0..name_list[i].size-1 do
    out_fn.print(name_list[i][j])
    if (j != name_list[i].size-1) then
      out_fn.print("=")
    end
  end
  out_fn.print("\n")
end

out_fn.close
