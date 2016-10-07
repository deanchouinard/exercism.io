defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &anagram?(String.upcase(&1), String.upcase(base)))
  end

  defp anagram?(a, b) when a == b, do: false
  defp anagram?(a, b) do
    sorted_list(a) == sorted_list(b)
  end

  defp sorted_list(str) do
    str
    |> String.graphemes
    |> Enum.sort
  end

end
