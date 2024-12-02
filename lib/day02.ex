defmodule Day02 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def read_file(filename) do
    File.read(filename)
  end

  # def task1() do
  #   {:ok, input} = read_file(~c"input01.txt")
  #   [list1, list2] = input |> parse_input
  #   calculate_distance_diff(list1, list2)
  # end

  # @doc ~S"""
  # Parses the input converting it into two new lists of integer sorted

  # ## Examples

  #     iex> Day01.parse_input("4 3 2\n1 2 4")
  #     [[4, 3, 2], [1, 2, 4]]

  # """
  def parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, ~r{\s}, trim: true) end)
  end

  # @doc ~S"""
  # Calculate the distance diff from two lists. The calculation is Sum(|xi - yi|),
  # where xi is the element i from the list x and yi is the element i from the list y

  # ## Examples

  #     iex> Day01.calculate_distance_diff([1,4], [2,3])
  #     2

  # """
  # def calculate_distance_diff(list1, list2) do
  #   Enum.zip_reduce([list1, list2], 0, fn [el1, el2], result ->
  #     result + abs(el1 - el2)
  #   end)
  # end

  # @doc ~S"""
  # It gets the similarity score list

  # ## Examples

  #     iex> Day01.get_similarity_score([1,2], [2,3])
  #     [0,2]

  # """
  # def get_similarity_score(list1, list2) do
  #   Enum.map(list1, fn x -> count(list2, x) * x end)
  # end

  # def count([], _), do: 0
  # def count([x | xs], x), do: 1 + count(xs, x)
  # def count([_ | xs], x), do: count(xs, x)

  # def task2() do
  #   {:ok, input} = read_file("input02.txt")
  #   [list1, list2] = input |> parse_input
  #   get_similarity_score(list1, list2) |> Enum.sum
  # end
end
