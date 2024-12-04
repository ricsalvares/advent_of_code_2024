defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "Tries to reads file and it works" do
    assert {:ok, _} = Day01.read_file("input_day01.txt")
  end

  test "Compare distance list" do
    rawInput = "3   4
                4   3
                2   5
                1   3
                3   9
                3   3"

    input1 = [1, 2, 3, 3, 3, 4]
    input2 = [3, 3, 3, 4, 5, 9]
    assert Day01.parse_input(rawInput) == [input1, input2]
  end

  test "calculate the diff " do
    input1 = [1, 2, 3, 3, 3, 4]
    input2 = [3, 3, 3, 4, 5, 9]
    assert Day01.calculate_distance_diff(input1, input2) == 11
  end

  test "task1 should return the task1 result" do
    assert Day01.task1() == 2_285_373
  end

  test "get_similarity_score example" do
    [list1, list2] = [[1, 2, 3, 3, 3, 4], [3, 3, 3, 4, 5, 9]]

    assert Day01.get_similarity_score(list1, list2) |> Enum.sort() ==
             Enum.sort([0, 0, 4, 9, 9, 9])
  end

  test "task2 example" do
    assert Day01.task2() == 21_142_653
  end
end
