defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  test "Tries to reads file and it works" do
    assert {:ok, _} = Day04.read_file("input_day05.txt")
  end

  test "parse_input" do
    raw_input = "47|53
97|13
53|13

75,47,61,53,29
97,13,75,29,47"

    expected_output = {
      [
        [47, 53],
        [97, 13],
        [53, 13]
      ],
      [[75, 47, 61, 53, 29], [97, 13, 75, 29, 47]]
    }

    assert Day05.parse_input(raw_input) == expected_output
  end

  test "create_rules_map" do
    rules = [
      [47, 53],
      [97, 13],
      [97, 61],
      [97, 47],
      [75, 29]
    ]

    expected_map = %{47 => [53], 97 => [13, 61, 47], 75 => [29]}
    rules = Day05.create_rules_map(rules)
    assert Map.keys(rules) == Map.keys(expected_map)

    Enum.map(Map.keys(rules), fn k ->
      assert Enum.sort(Map.get(rules, k)) == Enum.sort(Map.get(rules, k))
    end)
  end

  test "analyze_pages" do
    pages = [
      [75, 47, 61, 53, 29],
      [97, 61, 53, 29, 13],
      [75, 29, 13],
      [75, 97, 47, 61, 53],
      [61, 13, 29],
      [97, 13, 75, 29, 47]
    ]

    rules_map = %{
      29 => [13],
      47 => [29, 61, 13, 53],
      53 => [13, 29],
      61 => [29, 53, 13],
      75 => [13, 61, 47, 53, 29],
      97 => [75, 53, 29, 47, 61, 13]
    }

    assert Day05.analyze_pages(pages, rules_map) == [
             [75, 47, 61, 53, 29],
             [97, 61, 53, 29, 13],
             [75, 29, 13]
           ]
  end

  @tag :skip
  test "analyze_invalid_pages" do
    pages = [
      [75, 47, 61, 53, 29],
      [97, 61, 53, 29, 13],
      [75, 29, 13],
      [75, 97, 47, 61, 53],
      [61, 13, 29],
      [97, 13, 75, 29, 47]
    ]

    rules_map = %{
      29 => [13],
      47 => [29, 61, 13, 53],
      53 => [13, 29],
      61 => [29, 53, 13],
      75 => [13, 61, 47, 53, 29],
      97 => [75, 53, 29, 47, 61, 13]
    }

    assert Day05.analyze_invalid_pages(pages, rules_map) == [
             [75, 97, 47, 61, 53],
             [61, 13, 29],
             [97, 13, 75, 29, 47]
           ]
  end

  test "valid_page?" do
    valid = [75, 47, 61, 53, 29]
    not_valid = [75, 97, 47, 61, 53]

    rules = %{
      75 => [47, 61, 53, 29],
      47 => [61, 53, 29],
      61 => [53, 29],
      53 => [29],
      97 => [75]
    }

    assert Day05.valid_page?(Enum.reverse(valid), rules) == true
    assert Day05.valid_page?(Enum.reverse(not_valid), rules) == false
  end

  test "task1/1" do
    input = "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47"
    assert Day05.task1(input) == 143
  end

  test "task1/0" do
    assert Day05.task1() == 5248
  end
end
