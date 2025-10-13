defmodule ProblemRec11 do
  @moduledoc """
  Модуль для решения задачи №11.
  """

  def recursive_solution(grid) do
    rows = length(grid)
    cols = length(hd(grid))
    recursive_function(grid, 0, 0, 0, rows, cols)
  end

  defp recursive_function(_grid, rows, _j, max, rows, _cols), do: max

  defp recursive_function(grid, i, cols, max, rows, cols) do
    recursive_function(grid, i + 1, 0, max, rows, cols)
  end

  defp recursive_search(grid, i, j, max, rows, cols) do
    current_max =
      max
      |> horizontal(grid, i, j, cols)
      |> vertical(grid, i, j, rows)
      |> diagonal1(grid, i, j, rows, cols)
      |> diagonal2(grid, i, j, rows, cols)

    max(current_max, recursive_search(grid, i, j + 1, current_max, rows, cols))
  end

  defp horizontal(max, grid, i, j, cols) when j <= cols - 4 do
    product =
      get_in(grid, [Access.at(i), Access.at(j)]) *
        get_in(grid, [Access.at(i), Access.at(j + 1)]) *
        get_in(grid, [Access.at(i), Access.at(j + 2)]) *
        get_in(grid, [Access.at(i), Access.at(j + 3)])

    max(max, product)
  end

  defp horizontal(max, _grid, _i, _j, _cols), do: max

  defp vertical(max, grid, i, j, rows) when i <= rows - 4 do
    product =
      get_in(grid, [Access.at(i), Access.at(j)]) *
        get_in(grid, [Access.at(i + 1), Access.at(j)]) *
        get_in(grid, [Access.at(i + 2), Access.at(j)]) *
        get_in(grid, [Access.at(i + 3), Access.at(j)])

    max(max, product)
  end

  defp vertical(max, _grid, _i, _j, _rows), do: max

  defp diagonal1(max, grid, i, j, rows, cols) when i <= rows - 4 and j <= cols - 4 do
    product =
      get_in(grid, [Access.at(i), Access.at(j)]) *
        get_in(grid, [Access.at(i + 1), Access.at(j + 1)]) *
        get_in(grid, [Access.at(i + 2), Access.at(j + 2)]) *
        get_in(grid, [Access.at(i + 3), Access.at(j + 3)])

    max(max, product)
  end

  defp diagonal1(max, _grid, _i, _j, _rows, _cols), do: max

  defp diagonal2(max, grid, i, j, rows, cols) when i >= 3 and j <= cols - 4 do
    product =
      get_in(grid, [Access.at(i), Access.at(j)]) *
        get_in(grid, [Access.at(i - 1), Access.at(j + 1)]) *
        get_in(grid, [Access.at(i - 2), Access.at(j + 2)]) *
        get_in(grid, [Access.at(i - 3), Access.at(j + 3)])

    max(max, product)
  end

  defp diagonal2(max, _grid, _i, _j, _rows, _cols), do: max
end
