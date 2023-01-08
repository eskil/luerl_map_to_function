function get_map()
   map = {}
   map["function"] = increment
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
f = get_map()["function"]
f()
print("Number is "..number)
