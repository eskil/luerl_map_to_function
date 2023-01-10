# LuerlMapToFunction

This example demonstrates an issue with calling functions returned in a table.

For instance, if you want to get a function table;

```lua
function get_function_table()
  table = {}
  table["increment"] = do_increment
end

state = 0
function do_increment()
  state = state + 1
  return state
end
```

Obtaining the map and calling `increment` (aka `do_increment`) from luerl does
not provide an obvious way to pass in & update lua_state.

To get the table;

```elixir
{[lua_map], _lua_state} = :luerl.call_function([:get_function_table], [], lua_state)
ex_map = Map.new(lua_map)
function = ex_map["increment"]
[number] = function.([]) # How can the state be threaded through?
```

### Build and run

```
mix deps.get
mix deps.compile
mix escript.build
./luerl_map_to_function
```

The output (ignoring the `Function.info` output) is;

```
./luerl_map_to_function
lua: number is 2 (should be 2)
elixir number = 3 (should be 3)
function #Function<6.93491019/1 in :luerl.decode/3>
function info [
    pid: #PID<0.99.0>,
  module: :luerl,
  new_index: 6,
  new_uniq: <<51, 204, 154, 21, 95, 68, 126, 176, 146, 163, 10, 159, 121, 165,
    177, 253>>,
  index: 6,
  uniq: 93491019,
  name: :"-decode/3-fun-0-",
  arity: 1,
  env: [... lua state at capture time it seems..]
  type: :local
]
elixir number = 4 (should be 4)
elixir number = 4 (should be 5)
```

The two last calls are from elixir to lua via the bound function. It
does use the right initial state (3) in the first call, but since the
lua state isn't passed in, it's not updated and the next call still
sees the first state.
