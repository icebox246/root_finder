defmodule Roots do
  def print(poly) do
    len = length poly
    lst = Enum.zip [poly,(len - 1)..0]
    pairs = Enum.map lst, fn {c,e} -> to_string(c) <> "x^" <> to_string(e) end
    List.foldl(tl(pairs), hd(pairs), (fn e,acc -> acc <> " + " <> e end))
  end


  def calc(poly,x) do
    List.foldl(poly,0, (fn e,acc -> acc * x + e end))
  end

  def pdiv(poly, d, r \\ 0)

  def pdiv([_x], _d, _r) do
    [] 
  end

  def pdiv([x|xs], d, r) do
    [ x + r | pdiv(xs, d, (x + r) * d) ] 
  end

  def deriv(poly) do
    len = length poly
    lst = Enum.zip [poly,(len - 1)..0]

    Enum.take (Enum.map lst, fn {c,e} -> c * e end), (len - 1)
  end

  def findZero(poly) do
    der = deriv poly
    List.foldl(Enum.to_list(1..10000), 0, (fn _i, x -> x - (calc poly, x) / (calc der, x) end))
  end

  defp roots_(poly) do
    if length(poly) == 2 do
      [-Float.round((hd tl poly), 8)]
    else
      z = findZero poly
      if Float.floor(abs(calc(poly, z)), 8) == 0 do
        [z | roots_(pdiv(poly, z))]
      else
        []
      end
    end
  end

  def roots(poly) do
    fst = hd poly
    poly = Enum.map(poly,fn c -> c / fst end)
    Enum.map roots_(poly), fn v -> Float.round v, 3 end
  end
end
