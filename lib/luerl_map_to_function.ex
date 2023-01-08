defmodule LuerlMapToFunction do
  def main(_argv) do
    lua_state = :luerl.init()
    script = File.read!("sample.lua")
    {:ok, chunk, lua_state} = :luerl.load(script, lua_state)

    # Execute the chunk (number should be 2 now)
    {_, lua_state} = :luerl.do(chunk, lua_state)

    # Call increment directly (number should be 3)
    {[number], lua_state} = :luerl.call_function([:increment], [], lua_state)
    IO.puts("number = #{number}")
  end
end
