defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end

  defp _count([], n), do: n
  defp _count([head | tail], n) do
    _count(tail, n + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    _rev(l, [])
  end

  defp _rev([], rl), do: rl
  defp _rev([head | tail], rl) do
    rl = [head | rl]
    _rev(tail, rl)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f)
  end
  
  defp _map([], f), do: []
  defp _map([head | tail], f) do
    [f.(head) | _map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
