-- Gets a function table
function get_function_table()
   map = {}
   map["increment"] = do_increment
   return map
end

-- Every time we call this, increment the number so
-- we can see the global state changes
number = 0
function do_increment()
   number = number + 1
   return number
end

-- Call once first just to validate
do_increment()
-- Call via map to validate that
m = get_function_table()
f = m["increment"]
f()
print("lua: number is "..number.. " (should be 2)")
