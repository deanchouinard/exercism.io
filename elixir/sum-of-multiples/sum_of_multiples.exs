defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    mults = MapSet.new
    _to(limit, factors, mults)
  end

  def _to(_, [], _mults), do: 0
  def _to(limit, factors, _mults) when limit < hd(factors), do: 0
  def _to(limit, factors, mults) do
    {sum, mults} = facsum(limit, hd(factors), mults, 0, 0)
    sum + _to(limit, tl(factors), mults)
  end

  def facsum(limit, _factor, mults, mult, sum) when mult >= limit, do: {sum,
    mults}
  def facsum(limit, factor, mults, mult, sum) do
    {sum, mults} = if not MapSet.member?(mults, mult) do
      mults = MapSet.put(mults, mult)
      {sum + mult, mults}
    else
      {sum, mults}
    end

    facsum(limit, factor, mults, mult + factor, sum)
  end

end
