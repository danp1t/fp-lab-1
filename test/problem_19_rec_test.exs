defmodule Problem19RecTest do
  use ExUnit.Case
  import Problem19

  @base_path "test/resources/problem19"
  @test_count 10

  test_cases = for i <- 1..@test_count do
    input_file = Path.join([@base_path, "input", "input_#{i}.txt"])
    output_file = Path.join([@base_path, "output", "output_#{i}.txt"])

    if File.exists?(input_file) and File.exists?(output_file) do
      year = File.read!(input_file) |> String.trim() |> String.to_integer()
      expected = File.read!(output_file) |> String.trim() |> String.to_integer()
      {i, year, expected}
    else
      nil
    end
  end |> Enum.filter(& &1)

  for {test_number, year, expected} <- test_cases do
    test "test case #{test_number} from files" do
      actual = count_sundays(year)
      assert actual == expected,
             "Test failed for input_#{test_number}.txt: expected #{expected}, got #{actual}"
    end
  end

end
