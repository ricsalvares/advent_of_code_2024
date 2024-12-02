defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  # test "Tries to reads file and it works" do
  #   assert {:ok, _} = Day01.read_file("input01.txt")
  # end

  test "parse input" do
    raw_input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9x"

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

  # test "check_safity " do
  #   safe_increasing = [1, 3, 6, 7, 9]
  #   safe_decreasing = [7, 6, 4, 2, 1]

  #   assert Day02.check_safity(safe_increasing) == true
  #   assert Day02.check_safity(safe_decreasing) == true

  #   unsafe_increasing = [1, 2, 7, 8, 9]
  #   unsafe_decreasing = [9, 7, 6, 2, 1]

  #   assert Day02.check_safity(unsafe_increasing) == false
  #   assert Day02.check_safity(unsafe_decreasing) == false
  # end

  # test "task1 should return the task1 result" do
  #   assert Day01.task1() == 2_285_373
  # end

  # test "get_similarity_score example" do
  #   [list1, list2] = [[1, 2, 3, 3, 3, 4], [3, 3, 3, 4, 5, 9]]

  #   assert Day01.get_similarity_score(list1, list2) |> Enum.sort == Enum.sort([ 0, 0,4,9, 9, 9])
  # end

  # test "task2 example" do
  #   assert Day01.task2() == 21142653
  # end
end
