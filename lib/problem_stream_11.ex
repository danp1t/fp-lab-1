defmodule ProblemLazy11 do
  @moduledoc """
  Модуль для решения задачи №11.
  """

  def solution(grid) do
    rows = length(grid)
    cols = length(hd(grid))

    all_quads =
      Stream.concat([
        horizontal(grid, rows, cols),
        vertical(grid, rows, cols),
        diagonal1(grid, rows, cols),
        diagonal2(grid, rows, cols)
      ])

    all_quads
    |> Stream.map(&calculate/1)
    |> Enum.max()
  end

  defp horizontal(grid, rows, cols) do
    Stream.flat_map(0..(rows - 1), fn i ->
      Stream.map(0..(cols - 4), fn j ->
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
    Stream.flat_map(0..(rows - 4), fn i ->
      Stream.map(0..(cols - 1), fn j ->
        [
          get_in(grid, [Access.at(i), Access.at(j)]),
          get_in(grid, [Access.at(i + 1), Access.at(j)]),
          get_in(grid, [Access.at(i + 2), Access.at(j)]),
          get_in(grid, [Access.at(i + 3), Access.at(j)])
        ]
      end)
    end)
  end

  defp diagonal1(grid, rows, cols) do
    Stream.flat_map(0..(rows - 4), fn i ->
      Stream.map(0..(cols - 4), fn j ->
        [
          get_in(grid, [Access.at(i), Access.at(j)]),
          get_in(grid, [Access.at(i + 1), Access.at(j + 1)]),
          get_in(grid, [Access.at(i + 2), Access.at(j + 2)]),
          get_in(grid, [Access.at(i + 3), Access.at(j + 3)])
        ]
      end)
    end)
  end

  defp diagonal2(grid, rows, cols) do
    Stream.flat_map(3..(rows - 1), fn i ->
      Stream.map(0..(cols - 4), fn j ->
        [
          get_in(grid, [Access.at(i), Access.at(j)]),
          get_in(grid, [Access.at(i - 1), Access.at(j + 1)]),
          get_in(grid, [Access.at(i - 2), Access.at(j + 2)]),
          get_in(grid, [Access.at(i - 3), Access.at(j + 3)])
        ]
      end)
    end)
  end

  defp calculate([a, b, c, d]), do: a * b * c * d
end
