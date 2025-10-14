defmodule ProblemModule11 do
  @moduledoc """
  Модуль для решения задачи №11
  """

  def solution(grid) do
    grid
    |> generate_sequences()
    |> filter_sequences()
    |> calculate()
    |> find_max()
  end

  defp generate_sequences(grid) do
    rows = length(grid)
    cols = length(hd(grid))

    horizontal = horizontal(grid, rows, cols)
    vertical = vertical(grid, rows, cols)
    diagonal = diagonals(grid, rows, cols)

    horizontal ++ vertical ++ diagonal
  end

  defp horizontal(grid, rows, cols) do
    Enum.flat_map(0..(rows - 1), fn i ->
      Enum.map(0..(cols - 4), fn j ->
        [
          get_in(grid, [Access.at(i), Access.at(j)]),
          get_in(grid, [Access.at(i), Access.at(j + 1)]),
          get_in(grid, [Access.at(i), Access.at(j + 2)]),
          get_in(grid, [Access.at(i), Access.at(j + 3)])
        ]
      end)
    end)
  end

  defp vertical(grid, rows, cols) do
    Enum.flat_map(0..(rows - 4), fn i ->
      Enum.map(0..(cols - 1), fn j ->
        [
          get_in(grid, [Access.at(i), Access.at(j)]),
          get_in(grid, [Access.at(i + 1), Access.at(j)]),
          get_in(grid, [Access.at(i + 2), Access.at(j)]),
          get_in(grid, [Access.at(i + 3), Access.at(j)])
        ]
      end)
    end)
  end

  defp diagonals(grid, rows, cols) do
    diagonal1 =
      Enum.flat_map(0..(rows - 4), fn i ->
        Enum.map(0..(cols - 4), fn j ->
          [
            get_in(grid, [Access.at(i), Access.at(j)]),
            get_in(grid, [Access.at(i + 1), Access.at(j + 1)]),
            get_in(grid, [Access.at(i + 2), Access.at(j + 2)]),
            get_in(grid, [Access.at(i + 3), Access.at(j + 3)])
          ]
        end)
      end)

    diagonal2 =
      Enum.flat_map(3..(rows - 1), fn i ->
        Enum.map(0..(cols - 4), fn j ->
          [
            get_in(grid, [Access.at(i), Access.at(j)]),
            get_in(grid, [Access.at(i - 1), Access.at(j + 1)]),
            get_in(grid, [Access.at(i - 2), Access.at(j + 2)]),
            get_in(grid, [Access.at(i - 3), Access.at(j + 3)])
          ]
        end)
      end)

    diagonal1 ++ diagonal2
  end

  defp filter_sequences(sequences) do
    Enum.filter(sequences, fn sequence ->
      length(sequence) == 4
    end)
  end

  defp calculate(sequences) do
    Enum.map(sequences, fn sequence ->
      Enum.reduce(sequence, 1, fn element, accumulator ->
        element * accumulator
      end)
    end)
  end

  defp find_max(products) do
    case products do
      [] -> 0
      _ -> Enum.reduce(products, &max/2)
    end
  end
end
