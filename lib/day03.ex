defmodule Day03 do
  @mul_x_y_regex ~r/mul\(\d{1,3},\d{1,3}\)/

  def read_file(filename) do
    File.read(filename)
  end


  def task1() do
    {:ok, input} = read_file("input_day03.txt")
    input
    |> parse_input
    |> Enum.map(fn [x,y] -> x * y end)
    |> Enum.sum
  end

  def task1(input) do
    input
    |> parse_input
    |> Enum.map(fn [x,y] -> x * y end)
    |> Enum.sum
  end

  @doc ~S"""

  ## Examples

      iex> Day03.task2("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")
      48
  """
  def task2(input) do
    Enum.join(get_dos(input))
    |> task1
  end

  def get_dos(""), do: []
  def get_dos(string) do
    [first_part_dos|rest] = String.split(string, "don't()", parts: 2)
    if (length(rest) > 0) do
      [_|dos] = String.split(hd(rest), "do()", parts: 2)  
      cond do
        length(dos) > 0 -> [first_part_dos , get_dos(hd(dos))]
        true -> [first_part_dos]
      end
    else
      [first_part_dos]
    end
  end

  def task2() do
    { :ok, input } = read_file("input_day03.txt")
    task2(input)
  end



  @doc ~S"""
  Parses the input converting it into new list of lists, each sublist contains one element in 
  the format "mul(x,y)" where x and y can be 1 to 3 digits number
  ## Examples

      iex> Day03.parse_input("xmul(24,156)%&mul[3,7]mul(233,444)mul(9999,99)")
      [[24,156], [233,444]]
  """
  def parse_input(input) do
    Regex.scan(@mul_x_y_regex, input)
    |> Enum.map(&scan/1)
  end


  @doc ~S"""
  It converts ["mul(1,2)"] into a list of 2 integers, eg: [1,2]
  ## Examples

      iex> Day03.scan(["mul(43,14)"])
      [43,14]
  """
  def scan([]), do: []
  def scan([input]) do
    Regex.replace(~r/mul\(|\)/, input, "")
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
