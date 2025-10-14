defmodule ProblemModule19 do
  @moduledoc """
  Модуль для решения задачи №19.
  """

  def count_sundays(input_year) do
    generate_months(1901, input_year)
    |> Enum.reduce({2, 0}, fn {year, month}, {current_dow, count} ->
      new_count = if current_dow == 0, do: count + 1, else: count
      days_in_current_month = days_in_month(month, year)
      next_dow = rem(current_dow + days_in_current_month, 7)

      {next_dow, new_count}
    end)
    |> elem(1)
  end

  defp generate_months(start_year, end_year) do
    for year <- start_year..end_year, month <- 1..12, do: {year, month}
  end

  defp days_in_month(month, year) do
    cond do
      month in [4, 6, 9, 11] -> 30
      month == 2 and check_leap_year(year) == true -> 29
      month == 2 and check_leap_year(year) == false -> 28
      true -> 31
    end
  end

  defp check_leap_year(year) do
    if rem(year, 4) == 0 and (rem(year, 100) != 0 or rem(year, 400) == 0) do
      true
    else
      false
    end
  end
end
