defmodule Problem19Test do
  use ExUnit.Case
  import Problem19

  @base_path "test/resources/problem19"

  # Создаем отдельный тест для каждого файла
  for i <- 1..10 do
    input_file = Path.join([@base_path, "input", "input_#{i}.txt"])
    output_file = Path.join([@base_path, "output", "output_#{i}.txt"])

    if File.exists?(input_file) and File.exists?(output_file) do
      # Capture the values at compile time and make them available to the test
      year_val = File.read!(input_file) |> String.trim() |> String.to_integer()
      expected_val = File.read!(output_file) |> String.trim() |> String.to_integer()

      test "test case #{i} from files" do
        actual = count_sundays(year_val)
        assert actual == expected_val
      end
    end
  end
end
