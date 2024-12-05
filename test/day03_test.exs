defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "Tries to reads file and it works" do
    assert {:ok, _} = Day03.read_file("input_day03.txt")
  end

  test "parse input" do
    raw_input =
      "xmul(2,4)%&mul[3,7]!@^mul(1,3333)do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

    expected_output = [[2, 4], [5, 5], [11, 8], [8, 5]]

    assert Day03.parse_input(raw_input) == expected_output
  end

  test "task1" do
    assert Day03.task1() == 175_015_740
  end

  test "task2 short example" do
    input = "xmul(2,4)%&mul[3,7]!@^mul(1,3333)do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    assert Day03.task2(input) == 2 * 4 + 5 * 5 + 11 * 8 + 8 * 5
  end

  test "task2" do
    assert Day03.task2() == 112_272_912
  end
end
