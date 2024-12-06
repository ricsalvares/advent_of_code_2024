defmodule Day05 do
  def read_file(filename) do
    File.read(filename)
  end

  def parse_input(input) do
    [rules, pages] =
      input
      |> String.split("\n\n")

    page_order_rules =
      rules
      |> String.split("\n")
      |> Enum.map(fn row ->
        String.split(row, "|")
        |> Enum.map(&String.to_integer/1)
      end)

    pages_to_produce =
      pages
      |> String.split("\n")
      |> Enum.map(fn row ->
        String.split(row, ",")
        |> Enum.map(&String.to_integer/1)
      end)

    {page_order_rules, pages_to_produce}
  end

  def create_rules_map(rules) do
    Enum.reduce(rules, Map.new(), fn [x, y], map ->
      Map.update(map, x, [y], fn existing_value ->
        [y | existing_value]
      end)
    end)
  end

  def analyze_pages(pages, rules_map) do
    Enum.filter(pages, fn page ->
      Enum.reverse(page)
      |> valid_page?(rules_map)
    end)
  end

  def analyze_invalid_pages(pages, rules_map) do
    Enum.filter(pages, fn page ->
      Enum.reverse(page)
      |> valid_page?(rules_map)
    end)
  end

  def valid_page?([head | []], _), do: true

  def valid_page?([head | tail], rules_map) do
    rules = Map.get(rules_map, head, [])

    broken_rule_found =
      Enum.any?(rules, fn r ->
        Enum.member?(tail, r)
      end)

    !broken_rule_found && valid_page?(tail, rules_map)
  end

  def task1(input) do
    {rules, pages} = parse_input(input)
    rules_map = create_rules_map(rules)

    analyze_pages(pages, rules_map)
    |> Enum.reduce(0, fn page, acc ->
      middle_index = (length(page) / 2) |> floor
      Enum.fetch!(page, middle_index) + acc
    end)
  end

  def task1() do
    {:ok, input} = read_file("input_day05.txt")
    task1(input)
  end
end
