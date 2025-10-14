defmodule ProblemStream19 do
  @moduledoc """
  Модуль для решения задачи №19.
  """

  def count_sundays(input_year) do
    Stream.iterate({1900, 1, 1}, &next_date/1)
    |> Stream.take_while(fn {year, _month, _day} -> year <= input_year end)
    |> Stream.filter(fn {year, _month, _day} -> year >= 1901 end)
    |> Stream.filter(fn {_year, _month, day_of_week} -> rem(day_of_week, 7) == 0 end)
    |> Enum.count()
  end

  defp next_date({year, month, day_of_week}) do
    days = days_in_month(month, year)

    {next_year, next_month} =
      if month == 12 do
        {year + 1, 1}
      else
        {year, month + 1}
      end

    {next_year, next_month, day_of_week + days}
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
