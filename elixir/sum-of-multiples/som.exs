defmodule SumOfMultiples do
  def to(limit, factors) do
    1..limit - 1
    |> Enum.filter(fn x -> (Enum.any? factors, fn y -> rem(x,y) == 0 end) end)
    |> Enum.sum
  end
end

