defmodule Problem19 do
  @moduledoc """
  Модуль для решения задачи №19.
  """

  defp leap_year(year) do
    if rem(year, 4) == 0 and (rem(year, 100) != 0 or rem(year, 400) == 0) do
      true
    else
      false
    end
  end

  defp days_in_month(month, year) do
    cond do
      month in [4, 6, 9, 11] -> 30
      month == 2 and leap_year(year) == true -> 29
      month == 2 and leap_year(year) == false -> 28
      true -> 31
    end
  end

  defp count_sundays_in_year(current_year, current_month, day_of_week, end_year) do
    if current_year > end_year do
      0
    else
      count = if current_year >= 1901 and rem(day_of_week, 7) == 0, do: 1, else: 0

      days = days_in_month(current_month, current_year)

      {next_year, next_month} =
        if current_month == 12 do
          {current_year + 1, 1}
        else
          {current_year, current_month + 1}
        end

      count + count_sundays_in_year(next_year, next_month, day_of_week + days, end_year)
    end
  end

  def count_sundays(input_year) do
    count_sundays_in_year(1900, 1, 1, input_year)
  end
end
