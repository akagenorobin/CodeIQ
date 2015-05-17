include Math
require "fileutils"

in_fn = open("nick.txt", "r")

list = Hash.new

while line = in_fn.gets
  line.chomp!
  names = line.split("=")
  x = names[0]
  y = names[1]

  x = list[x] while list.key?(x)
  y = list[y] while list.key?(y)
  list[x] = y if x != y
  list.delete(y)

  list.each_key{|key|
    root = list[key]
    root = list[root] if list.key?(root)
    list[key] = root
  }
end

array = Array.new(0).map! { Array.new }

list.each_key{|key1|
  i = array.size
  array[i] = [ list[key1], key1 ]
  list.delete(key1)
  list.each_key{|key2|
    if list[key2] == array[i][0]
      array[i].push(key2)
      list.delete(key2)
    end
  }
}

array.each{|elem|
  elem.sort!
}

array.sort!

p array

FileUtils.touch("answer1.txt")
out_fn = open("answer1.txt","w")

for i in 0..array.size-1 do
  for j in 0..array[i].size-1 do
    out_fn.print(array[i][j])
    if (j != array[i].size-1) then
      out_fn.print("=")
    end
  end
  out_fn.print("\n")
end
out_fn.close
