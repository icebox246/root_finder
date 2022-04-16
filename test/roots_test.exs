defmodule RootsTest do
  use ExUnit.Case
  doctest Roots

  test "finds roots of x^2 + 4x + 4" do
    assert Roots.roots([1, 4, 4]) == [-2, -2]
  end

  test "finds roots of 1000x^2 - 2x - 1" do
    assert Roots.roots([1000, -2, -1]) == [-0.031, 0.033]
  end
end
