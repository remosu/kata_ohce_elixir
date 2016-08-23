defmodule OhceCLITest do
  use ExUnit.Case
  doctest Ohce.CLI

  test "input_words" do
    {:ok, pid} = StringIO.open("Word1\nWord2\nWord3\nWord4")
    assert Enum.take(Ohce.CLI.input_words(pid), 3) == ["Word1\n", "Word2\n", "Word3\n"]
  end
end
