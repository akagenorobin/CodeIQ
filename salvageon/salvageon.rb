require 'net/http'
require 'uri'

target1 = 208050656559285601386927895421059705239114932023754
target2 = 2023636070998557444542586045

def getkey(n, i)
  uri = URI.parse("http://salvageon.textfile.org/?db=#{n}&index=#{i}")
  data = Net::HTTP.get(uri).split()
  sleep(1)
  key = data[2].gsub("K","").to_i
  val = data[3]
  return key, val
end

def output(n, top, bottom)
  keyb = 0
  for i in top..bottom
    key, val = getkey(n, i)
    print "#{i} #{key} #{key-keyb}\n"
    keyb = key
  end
end

def search1(n, top, bottom, target)
  mid = ((top + bottom)/2).to_i
  key, val = getkey(n, mid)
  if key == target
    return val
  elsif key < target
    search1(n, mid, bottom, target)
  else
    search1(n, top, mid, target)
  end
end

def search2(n, target)
  k = 0
  while true
    i = 2**k
    key1, val1 = getkey(2, i+1)
    if key1 < target
      key2, val2 = getkey(2, i)
      gap = (target - key2)/(key1 - key2)
      key, val = getkey(2, i+gap)
      if key == target
        return val
      end
    end
    k += 1
  end
end

ans1 = search1(1, 0, 1267650600228229401496703205376, target1)
print ans1, "\n"
ans2 = search2(2, target2)
print ans2, "\n"
