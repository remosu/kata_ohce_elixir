defmodule Ohce do
  @greetings_by_hour Map.merge(
    (for k <- 6..11, into: %{}, do: {k, "Buenos días"}),
    (for k <- 12..19, into: %{}, do: {k, "Buenas tardes"})
  )

  def greet(name, hour), do: "¡#{greet(hour)} #{name}!"
  def greet(hour), do: Map.get(@greetings_by_hour, hour, "Buenas noches")

  def reversed_echo(input) do
    input
      |> Stream.map(&String.strip/1)
      |> Stream.take_while(&(&1 != "Stop!"))
      |> Stream.map(&({&1, String.reverse(&1)}))
      |> Stream.map(&reverse_output/1)
  end

  defp reverse_output({word, word}), do: "#{word}\nBonita palabra"
  defp reverse_output({_, drow}), do: drow
end
