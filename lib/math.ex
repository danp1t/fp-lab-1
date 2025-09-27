defmodule Math do
  @moduledoc """
  Модуль для математических операций.
  """
  def add(a, b) do
    a + b
  end

  def divide(a, b) when b != 0 do
    a / b
  end

  def divide(_, 0) do
    {:error, "Division by zero"}
  end
end
