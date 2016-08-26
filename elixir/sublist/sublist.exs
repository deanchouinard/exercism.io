defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist
  def compare(a, b) do
    if a == b do
      :equal
    else
      if _compare(a, b, Enum.count(a)) do
        :sublist
      else
        if _compare(b, a, Enum.count(b)) do
          :superlist
        else
          :unequal
        end
      end
    end
  end

  def _compare(a, b, a_count) do
    if a_count > Enum.count(b) do
      false
    else
      if a === Enum.slice(b, 0, a_count) do
        true
      else
        _compare(a, tl(b), a_count)
      end
    end
  end
end

