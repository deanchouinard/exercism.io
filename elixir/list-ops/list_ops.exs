defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l)
  end

  defp _count([]), do: 0
  defp _count([_head | tail]) do
    1 + _count(tail)
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
  
  defp _map([], _), do: []
  defp _map([head | tail], f) do
    [f.(head) | _map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f)
  end

  defp _filter([], _), do: []
  defp _filter([head | tail], f) do
    cond do
      f.(head) ->
        [ head | _filter(tail, f)]
      true ->
        _filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, _), do: acc
  defp _reduce([head | tail], acc, f) do
    _reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    _append(a, b)
  end
  
  defp _append([], []), do: []
  defp _append([], b), do: b
  defp _append(a, []), do: a
  defp _append(a, b) do
    a = reverse(a)
    prepend(b, a)
  end

  defp prepend(b, []), do: b
  defp prepend(b, [head | tail]) do
    prepend([head | b], tail)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    _concat(ll)
  end

  defp _concat([]), do: []
  defp _concat([head | tail]) do
    append(head, _concat(tail))
  end

end
