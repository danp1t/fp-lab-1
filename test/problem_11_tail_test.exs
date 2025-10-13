defmodule Problem11RecTailTest do
  use ExUnit.Case
  import ProblemRecTail11

  @base_path "test/resources/problem11"

  test "test case 1" do
    test_file_pair(1)
  end

  test "test case 2" do
    test_file_pair(2)
  end

  test "test case 3" do
    test_file_pair(3)
  end

  test "test case 4" do
    test_file_pair(4)
  end

  test "test case 5" do
    test_file_pair(5)
  end

  test "test case 6" do
    test_file_pair(6)
  end

  test "test case 7" do
    test_file_pair(7)
  end

  test "test case 8" do
    test_file_pair(8)
  end

  test "test case 9" do
    test_file_pair(9)
  end

  test "test case 10" do
    test_file_pair(10)
  end

  defp read_grid_from_file(file_path) do
    file_path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp test_file_pair(i) do
    input_file = Path.join([@base_path, "input", "input_#{i}.txt"])
    output_file = Path.join([@base_path, "output", "output_#{i}.txt"])

    expected_val = File.read!(output_file) |> String.trim() |> String.to_integer()

    actual = rec_tail_solution(read_grid_from_file(input_file))
    assert actual == expected_val
  end
end
