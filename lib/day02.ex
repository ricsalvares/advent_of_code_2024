defmodule Day02 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def read_file(filename) do
    File.read(filename)
  end

  def task1() do
    {:ok, input} = read_file("input_day02.txt")

    input
    |> parse_input
    |> count_safe
  end

  @doc ~S"""
  Parses the input converting it into new list of lists, each sublist is a list of integer.

  ## Examples

      iex> Day02.parse_input("4 3 2\n1 2 4")
      [[4, 3, 2], [1, 2, 4]]

  """
  def parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, ~r{\s}, trim: true) end)
    |> Enum.map(fn line -> line |> Enum.map(&String.to_integer/1) end)
  end

  @doc ~S"""
  Check if a list is safe, by comparing the each element with the next one, 
  if the absolute difference betweeen them is beteween 1 and 3, the list is safe

  ## Examples

      iex> Day02.check_safety([1,4])
      true

  """
  def check_safety([head | [htail | _tail]] = list) when head > htail,
    do: check_safety_decreasing(list)

  def check_safety([head | [htail | _tail]] = list) when head < htail,
    do: check_safety_increasing(list)

  def check_safety(_list), do: false

  def check_safety_decreasing([_head | []]), do: true

  def check_safety_decreasing([head | [htail | _ttail] = tail]) do
    diff = head - htail
    if diff >= 1 && diff <= 3, do: check_safety_decreasing(tail), else: false
  end

  def check_safety_increasing([_head | []]), do: true

  def check_safety_increasing([head | [htail | _ttail] = tail]) do
    diff = htail - head
    if diff >= 1 && diff <= 3, do: check_safety_increasing(tail), else: false
  end

  @doc ~S"""
  It counts how many safe line exists on a list of lines

  ## Examples

      iex> Day02.count_safe([[1,2], [2,1,3], [5, 1]])
      1
  """
  def count_safe(list) do
    list |> Enum.count(&check_safety/1)
  end

  def task2() do
    {:ok, input} = read_file("input_day02.txt")

    not_safe =
      input
      |> parse_input
      |> Enum.filter(fn line -> !check_safety(line) end)

    safe_count = length(parse_input(input)) - length(not_safe)

    tolerate =
      not_safe
      |> count_tolerate

    safe_count + tolerate
  end

  @doc ~S"""
  ## Examples

      iex> Day02.count_tolerate([[94, 92, 89, 86, 83, 80], [1,5,10]])
      1
  """
  def count_tolerate(lists) do
    lists
    |> Enum.count(fn line ->
      sublists(line) |> Enum.any?(&check_safety/1)
    end)
  end

  defp sublists(list) do
    Enum.map(0..(length(list) - 1), fn index ->
      List.delete_at(list, index)
    end)
  end
end
