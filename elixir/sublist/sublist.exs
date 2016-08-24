defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    _compare(a, b)
  end

  def _compare([], []), do: :equal
  def _compare([], [nil]), do: :sublist
  def _compare([nil], []), do: :superlist
  def _compare(a, b) do
    cond do
      a == b -> :equal
      true -> compare2(a, b)

      #true -> scompare(a, b, [], [])
    end
  end

  def compare2(a, b) do
    _compare2(a, b, false)
  end

  def _compare2([], _, false), do: :unequal
  def _compare2([], _, true), do: :sublist
  def _compare2(_, [], false), do: :unequal
  def _compare2(_, [], true), do: :unequal
  def _compare2(a, b, match) do
    if hd(a) == hd(b) do
      match = true
      _compare2(tl(a), tl(b), match)
    else
      _compare2(a, tl(b), match)
    end
  end
end

#   def scompare([], _, _, _), do: :unequal
#   def scompare(_, [], _, _), do: :unequal
#   def scompare([heada | taila] = a, [headb | tailb] = b, suba, subb) do
#     heada = [heada | []]
#     headb = [headb | []]
#     suba = suba ++ heada
#     subb = subb ++ headb
#     cond do
#       a == headb or a == tailb or a === subb -> :sublist
#       b == heada or b == taila or b === suba -> :superllist
#       #      true -> scompare(taila, tailb, suba ++ heada, subb ++ headb)
#       true -> scompare(taila, tailb, suba , subb)
#     end
#   end
#
# end

# find the first elelement of a in b
# if found
#   does the next element in a match the next element in b
#   if a runs out before a non match it is a sublist

