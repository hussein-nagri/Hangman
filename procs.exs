defmodule Procs do

  def greeter(count) do
    receive do
      {:add, n} ->
        greeter(count+n)
      {:boom, reason} ->
        exit(reason)
      msg ->
        IO.puts "#{count}, thats the count. This is #{what_to_say}: #{msg}"
        greeter(count)

    end
  end


end
