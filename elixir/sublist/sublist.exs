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
      if _compare(a, b) do
        :sublist
      else
        if _compare(b, a) do
          :superlist
        else
          :unequal
        end
      end
    end
  end

  #  def _compare(_, []), do: false
  def _compare(a, b) do
    a_count = Enum.count(a)
    b_count = Enum.count(b)

    if a === Enum.slice(b, 0, a_count) do
      true
    else
      if a_count > b_count do
        false
      else
        _compare(a, tl(b))
      end
    end
  end
end
#
#   def compare2(a, b) do
#     if _compare2(a, b, false, a) do
#       :sublist
#     else
#       if _compare2(b, a, false, b) do
#         :superlist
#       else
#         :unequal
#       end
#     end
#   end
#
#   def _compare2([], _, false, _), do: false
#   def _compare2([], _, true, _), do: true
#   def _compare2(_, [], false, _), do: false
#   def _compare2(_, [], true, _), do: false 
#   def _compare2(a, b, match, ref) do
#     if hd(a) === hd(b) do
#       match = true
#       _compare2(tl(a), tl(b), match, ref)
#     else
#       if match do
#         match = false
#         _compare2(ref, tl(b), match, ref)
#       else
#         _compare2(a, tl(b), match, ref)
#       end
#
#     end
#   end
# end
#
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

