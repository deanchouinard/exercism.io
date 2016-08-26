defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist
  def compare(a, b) do
    cond do
      a == b -> :equal
      _compare(a, b, Enum.count(a)) -> :sublist
      _compare(b, a, Enum.count(b)) -> :superlist
      true -> :unequal
    end
  end

  def _compare(a, b, a_count) do
    cond do
      a_count > Enum.count(b) -> false
      a === Enum.slice(b, 0, a_count) -> true
      true ->_compare(a, tl(b), a_count)
    end
  end
end

