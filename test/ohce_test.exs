defmodule OhceTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  doctest Ohce

  test_with_params "nigth greeting",
  fn(hour) ->
    assert Ohce.greet("Cuco", hour) == "¡Buenas noches Cuco!"
  end do
    [{20}, {21}, {22}, {23}, {0}, {1}, {2}, {3}, {4}, {5}]
  end

  test_with_params "day greeting",
  fn(hour) ->
    assert Ohce.greet("Cuco", hour) == "¡Buenos días Cuco!"
  end do
    [{6}, {7}, {8}, {9}, {10}, {11}]
  end

  test_with_params "evening greeting",
  fn(hour) ->
    assert Ohce.greet("Cuco", hour) == "¡Buenas tardes Cuco!"
  end do
    [{12}, {13}, {14}, {15}, {16}, {17}, {18}, {19}]
  end

  test "input_words" do
    {:ok, pid} = StringIO.open("Word1\nWord2\nWord3\nWord4")
    assert Enum.take(Ohce.CLI.input_words(pid), 3) == ["Word1\n", "Word2\n", "Word3\n"]
  end

  test "reversed_echo" do
    assert Enum.to_list(Ohce.reversed_echo(["hola\n", "oto", "Stop!\n", "hi?\n"])) == ["aloh", "oto\nBonita palabra"]
  end
end
