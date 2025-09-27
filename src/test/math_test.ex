defmodule MathTest do
  use ExUnit.Case

  test "add/2 with positive numbers" do
    assert Math.add(2, 3) == 5
  end

  test "add/2 with negative numbers" do
    assert Math.add(-1, -2) == -3
  end

  test "add/2 commutative property" do
    assert Math.add(2, 3) == Math.add(3, 2)
  end
end
