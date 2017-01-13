defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @ref_string ?a..?z |> Enum.map(&<<&1>>)

  @spec pangram?(String.t) :: boolean
  def pangram?(""), do: false
  def pangram?(sentence) do
    sentence
    |> String.downcase
    |> String.graphemes
    |> Enum.filter(fn(x) -> x in @ref_string end)
    |> Enum.uniq
    |> Enum.sort
    |> is_pangram?
  end

  defp is_pangram?(a), do: a == @ref_string
end
