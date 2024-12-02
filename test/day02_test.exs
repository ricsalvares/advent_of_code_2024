defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "Tries to reads file and it works" do
    assert {:ok, _} = Day02.read_file("input_day2.txt")
  end

  test "parse input" do
    raw_input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

    expected_output = [
      [7, 6, 4, 2, 1],
      [1, 2, 7, 8, 9],
      [9, 7, 6, 2, 1],
      [1, 3, 2, 4, 5],
      [8, 6, 4, 4, 1],
      [1, 3, 6, 7, 9]
    ]

    assert Day02.parse_input(raw_input) == expected_output
  end

  test "check_safety " do
    safe_increasing = [1, 3, 6, 7, 9]
    safe_decreasing = [7, 6, 4, 2, 1]

    assert Day02.check_safety(safe_increasing) == true
    assert Day02.check_safety(safe_decreasing) == true

    unsafe_increasing = [70, 71, 72, 79, 82]
    unsafe_increasing2 = [1, 2, 7, 8, 9]
    unsafe_decreasing = [9, 7, 6, 2, 1]
    unsafe_decreasing2 = [8, 6, 4, 4, 1]
    unsafe = [1, 3, 2, 4, 5]

    assert Day02.check_safety(unsafe_increasing) == false
    assert Day02.check_safety(unsafe_increasing2) == false
    assert Day02.check_safety(unsafe_decreasing) == false
    assert Day02.check_safety(unsafe_decreasing2) == false
    assert Day02.check_safety(unsafe) == false
  end

  test "task1 should return the task1 result" do
    assert Day02.task1() == 332
  end


  test "task2 example" do
    assert Day02.task2() == 398
  end

  test "count_safe" do
    lists = [[1, 2, 3, 3, 3, 4], [3, 4, 5, 7, 9]]

    assert Day02.count_safe(lists) == 1
  end
end
