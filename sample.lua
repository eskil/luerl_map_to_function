function get_map()
   map = {}
   map["increment"] = increment
   return map
end

-- Every time we call this, increment the number so
-- we can see the global state changes
number = 0
function increment()
   number = number + 1
   return number
end

-- Call once first just to validate
increment()
-- Call via map to validate that
m = get_map()
f = m["increment"]
f()
print("lua: number is "..number)
