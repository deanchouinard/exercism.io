defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do

    _to(limit, factors, 0)
  end

  def _to(_, [], acc), do: acc
  def _to(limit, factors, acc) when limit < hd(factors), do: acc
  def _to(limit, factors, acc) do
    acc = acc + facsum(limit, hd(factors), 0)
    IO.puts acc
    _to(limit, tl(factors), acc)
  end

  #  def facsum(limit, factor, acc) when acc + factor >= limit, do: acc
  def facsum(limit, factor, acc) do
    acc = if acc + factor < limit do
      facsum(limit, factor, acc + factor)
    else
      acc
    end

    # acc = acc + factor
    # case acc < limit
    #   true -> facsum(limit, factor, acc)
    #   _ ->
  end


end
