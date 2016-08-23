defmodule Ohce.CLI do
  import Ohce

  def main(args) do
    name = Enum.join(args, " ")
    IO.puts greet(name, hour(:calendar.local_time))
    :stdio
      |> input_words
      |> reversed_echo
      |> Enum.each(&(IO.puts(&1)))
    IO.puts "Adios #{name}"
  end

  def input_words(device) do
    Stream.repeatedly(fn -> IO.gets(device, "> ") end)
  end

  defp hour({_, {hour, _, _}}), do: hour
end
