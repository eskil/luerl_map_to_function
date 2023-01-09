defmodule LuerlMapToFunction do
  def main(_argv) do
    lua_state = :luerl.init()
    script = File.read!("sample.lua")
    {:ok, chunk, lua_state} = :luerl.load(script, lua_state)

    # Execute the chunk (number should be 2 now)
    {_, lua_state} = :luerl.do(chunk, lua_state)

    # Call increment directly
    {[number], lua_state} = :luerl.call_function([:increment], [], lua_state)
    IO.puts("elixir number = #{number} (should be 3)")

    # Get function table and get the reference to the increment function
    {[lua_map], _lua_state} = :luerl.call_function([:get_function_table], [], lua_state)
    ex_map = Map.new(lua_map)
    function = ex_map["increment"]
    IO.puts("function #{inspect function}")
    IO.puts("function info #{inspect Function.info(function), pretty: true}")

    # Call the function - this take the lua_state so it won't update the vm's state
    [number] = function.([])
    IO.puts("elixir number = #{number} (should be 4)")

    # Call the function
    [number] = function.([])
    IO.puts("elixir number = #{number} (should be 5)")
  end
end
